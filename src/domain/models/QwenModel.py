import logging
import time
from typing import Dict, List, Optional, Union
import warnings

import gc
import torch
import torch.nn.functional as F
from transformers import AutoModelForCausalLM, AutoTokenizer

from src.helpers.dataset import DatasetInstance
from src.helpers.model import Model, ModelConfig, PredictionResult, get_device

logger = logging.getLogger(__name__)


class QwenModel(Model):
    def __init__(self, model_name: str, device: Optional[str] = None):
        if device is None:
            device = get_device()

        start_time = time.time()

        # self.model = AutoModelForCausalLM.from_pretrained(
        #     model_name,
        #     torch_dtype=torch.bfloat16,
        # ).to(device)
        self.model = AutoModelForCausalLM.from_pretrained(
            model_name,
            torch_dtype=torch.bfloat16,
            device_map="auto",
            attn_implementation="eager"
        )
        self.model.eval()

        tokenizer = AutoTokenizer.from_pretrained(model_name)

        device_resolved = self.model.device
        # super().__init__(tokenizer, device=device_resolved)
        super().__init__(tokenizer, device=device_resolved)

        elapsed_time = time.time() - start_time
        logger.info(
            f"Model initialization completed in {elapsed_time:.2f} seconds"
        )

    def prepare_prompt(self, source_code: str, source_lang: str, target_lang: str) -> str:
        user_prompt = (
            f'''You are a precise x86→ARMv8 SIMD assembler translator. When generating code, ensure:
 
1. ✅ Initialize all SIMD registers before use.

2. 🛡️ Use extra regs or stack spills as needed to avoid overwriting key values.

3. 📌 Always preserve original registers—don’t clobber them without saving/restoring.

4. 🔄 Compute and store intermediate values correctly:

   mov wTemp, wCount 

   add wCount, wCount, #1 

   str wMax, [addr, wTemp, sxtw #3]

   mov wMax, #0

   → NEVER reset before storing.

5. 🔁 After SIMD operations, include full reductions:

   mul.4s v0, v1, v0  

   mul.4s v0, v2, v0  

   mul.4s v0, v3, v0

6. ↩️ No early returns or premature stores—only at original exit.

7. 🤔 Chain-of-thought check before output:

   - Did I init every SIMD reg?

   - Did I use temp for stores without overwriting?

   - Did I store real values before resets?

   - Did I perform all reductions?

   - Am I respecting return flow and calling conventions?
 
Generate ARMv8 assembly that strictly follows these invariants.

  \n
           {source_code}'''
        )
        messages = [
            {"role": "user", "content": user_prompt}
        ]
        chat_text = self.tokenizer.apply_chat_template(
            messages, tokenize=False, add_generation_prompt=True
        )
        return chat_text

    def tokenize(self, text: Union[str, List[str]], **kwargs) -> Dict[str, torch.Tensor]:
        logger.debug(f"Tokenizing text{'s' if isinstance(text, list) else ''} "
                     f"of length: {len(text) if isinstance(text, str) else len(text[0])}")

        tokens = self.tokenizer(
            text, return_tensors="pt", padding=True, truncation=True, **kwargs
        ).to(self.device)

        logger.debug(f"Tokenized shape: {tokens['input_ids'].shape}")
        return tokens

    def decode(self, token_ids: torch.Tensor, **kwargs) -> Union[str, List[str]]:
        decoded = self.tokenizer.batch_decode(
            token_ids,
            skip_special_tokens=True,
        )
        if token_ids.shape[0] == 1:
            return decoded[0]
        return decoded

    def infer(self, input_tokens: Dict[str, torch.Tensor], config: ModelConfig, **kwargs):
        logger.info(
            f"Starting inference with temperature={config.temperature}, "
            f"max_length={config.max_length}"
        )
        input_token_count = input_tokens["input_ids"].shape[1]
        context_size = 8000
        max_new_tokens = max(context_size - input_token_count, 1000)

        if input_token_count > context_size - 1000:
            logger.warning("Input too long. Truncating.")
            input_tokens["input_ids"] = input_tokens["input_ids"][:, :(context_size - 2000)]
            input_tokens["attention_mask"] = input_tokens["attention_mask"][:, :(context_size - 2000)]
            input_token_count = input_tokens["input_ids"].shape[1]
            max_new_tokens = max(context_size - input_token_count, 1000)

        print(f"Inferencing with max_new_tokens={max_new_tokens}")

        with torch.no_grad():   
            outputs = self.model.generate(
                **input_tokens,
                max_new_tokens=max_new_tokens,
                temperature=0.3,
                num_beams=1,
                num_return_sequences=1,
                do_sample=False,
                output_scores=True,
                return_dict_in_generate=True,
                output_attentions=True,
                eos_token_id=self.tokenizer.eos_token_id,
                use_cache=True,
            )

        logprobs = self.get_total_logprobs(outputs, input_tokens["input_ids"].shape[1])
        sorted_indices = sorted(range(len(logprobs)), key=lambda i: logprobs[i], reverse=True)

        best_idx = sorted_indices[0]  # index of most probable sequence
        best_sequence = outputs.sequences[best_idx, input_tokens["input_ids"].shape[1]:].unsqueeze(0)
        best_alignments = self.get_alignments(outputs, input_tokens["input_ids"].shape[1])
        best_confidence = self.get_confidence(outputs, best_idx)

        return (
            input_tokens["input_ids"],
            best_sequence,
            best_alignments,
            best_confidence,
        )
    def get_total_logprobs(self, outputs, prompt_len: int) -> List[float]:
        """Calculate total log-probability for each sequence."""
        logprobs = []
        scores = outputs.scores  # list of [num_sequences x vocab] logits
        num_sequences = outputs.sequences.shape[0]

        for i in range(num_sequences):
            sequence = outputs.sequences[i, prompt_len:]
            total_logprob = 0.0
            for t, logits in enumerate(scores):
                probs = F.log_softmax(logits[i], dim=-1)
                token_id = sequence[t]
                total_logprob += probs[token_id].item()
            logprobs.append(total_logprob)
        return logprobs

    def get_alignments(self, pred_outputs, prompt_len, top_k=5, batch_size=1):
        out_seq_len = pred_outputs.sequences.shape[-1] - prompt_len
        aligned_tokens = []

        for idx in range(len(pred_outputs.attentions)):
            if idx >= len(pred_outputs.attentions):
                continue

            try:
                attn = pred_outputs.attentions[idx][-1]

                last_layer_attn = attn.mean(dim=1)[:, 0].detach().cpu()
                del attn

                if last_layer_attn.shape[1] > prompt_len:
                    relevant_attn = last_layer_attn[:, :prompt_len]
                else:
                    relevant_attn = last_layer_attn

                top_k_actual = min(top_k, relevant_attn.shape[1])
                top_indices = relevant_attn[0].topk(
                    top_k_actual).indices.tolist()
                aligned_tokens.append(top_indices)

                del last_layer_attn
                del relevant_attn

            except Exception as e:
                print(
                    f"Warning: Error processing attention at index {idx}: {e}")
                aligned_tokens.append([0] * top_k)

            if torch.cuda.is_available():
                torch.cuda.empty_cache()

        return aligned_tokens
    def get_confidence(self, outputs, idx: int) -> (List[float], float):
        confidences = []
        scores = outputs.scores
        generated_tokens = outputs.sequences[idx, -len(scores):]

        for step, logits in enumerate(scores):
            probs = F.softmax(logits[idx], dim=-1)
            confidence = probs[generated_tokens[step]]
            confidences.append(confidence.item())
        
        avg_confidence = sum(confidences) / len(confidences) if confidences else 0.0
        return confidences, avg_confidence


    def predict(self, instance: DatasetInstance, config: ModelConfig) -> PredictionResult:
        self.model.eval()

        with torch.no_grad():
            prompt = self.prepare_prompt(instance.source, instance.source_lang, instance.target_lang)
            tokenized_input = self.tokenize(prompt)
            print("✅ CUDA available:", torch.cuda.is_available())
            print("📟 Active CUDA device:", torch.cuda.current_device())
            print("🔧 CUDA device name:", torch.cuda.get_device_name(torch.cuda.current_device()))
            print("Beginning Inference")
            input_ids, output_ids, alignments, confidence = self.infer(tokenized_input, config)
        print("Inference Done")
        result = PredictionResult(
            instance_id=instance.instance_id,
            source=input_ids.detach().cpu()[0],
            pred=output_ids.detach().cpu()[0],
            alignments=alignments,
            confidence=confidence,
        )

        gc.collect()
        if torch.cuda.is_available():
            torch.cuda.empty_cache()

        return result
