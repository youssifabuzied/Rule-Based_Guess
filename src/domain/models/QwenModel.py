"""Implementation of Qwen-based assembly transpiler model."""

from typing import Dict, List, Optional, Union

import torch
import warnings
from transformers import AutoModelForCausalLM, AutoTokenizer

from src.helpers.model import Model, InferenceConfig, InferenceResult


class QwenModel(Model):
    """Concrete implementation of Qwen-based assembly transpiler model.
    
    This class implements the Model interface using the Qwen architecture,
    specifically optimized for assembly code translation tasks.
    """

    def __init__(self, model_name: str, device: Optional[str] = "auto"):
        """
        Initialize Qwen model and tokenizer.
        Args:
            model_name: Huggingface model ID or local checkpoint path.
            device: device_map argument for loading models (usually "auto").
        """
        self.model = AutoModelForCausalLM.from_pretrained(
            model_name,
            torch_dtype=torch.bfloat16,
            device_map=device,
            #attn_implementation="flash_attention_2"
        )
        tokenizer = AutoTokenizer.from_pretrained(model_name)
        tokenizer.padding_side = "left"
        tokenizer.pad_token = tokenizer.eos_token
        device_resolved = self.model.device
        super().__init__(tokenizer, device=device_resolved)

        self.model.eval()
        # Suppress pad_token_id warnings from transformers
        warnings.filterwarnings(
            "ignore",
            category=UserWarning,
            message=".*pad_token_id*"
        )

    def prepare_prompt(self, source_code: str, source_lang: str, target_lang: str) -> str:
        """Prepare system/user prompt for chat-based inference."""
        system_prompt = (
            f"You are a helpful coding assistant specialized in converting from {source_lang} to {target_lang} assembly."
        )
        user_prompt = (
            f"Convert the following {source_lang} assembly code to {target_lang} assembly:\n"
            f"```{source_lang.lower()}asm\n{source_code}```"
        )
        messages = [
            {"role": "system", "content": system_prompt},
            {"role": "user", "content": user_prompt}
        ]
        chat_text = self.tokenizer.apply_chat_template(
            messages, tokenize=False, add_generation_prompt=True
        )
        return chat_text

    def tokenize(self, text: Union[str, List[str]], **kwargs) -> Dict[str, torch.Tensor]:
        """Tokenize input text and move tensors to model device."""
        return self.tokenizer(
            text, return_tensors="pt", padding=True, truncation=True, **kwargs
        ).to(self.device)

    def decode(self, token_ids: torch.Tensor, **kwargs) -> Union[str, List[str]]:
        """Decode generated tokens."""
        decoded = self.tokenizer.batch_decode(token_ids, skip_special_tokens=True, **kwargs)
        if token_ids.shape[0] == 1:
            return decoded[0]
        return decoded

    def infer(
        self,
        input_tokens: Dict[str, torch.Tensor],
        config: Optional[InferenceConfig] = None,
        **kwargs
    ) -> InferenceResult:
        """Perform inference on prepared input tokens."""
        if config is None:
            config = InferenceConfig()

        output = self.model.generate(
            input_ids=input_tokens["input_ids"],
            attention_mask=input_tokens.get("attention_mask"),
            max_new_tokens=config.max_length,
            temperature=config.temperature,
            num_return_sequences=config.num_return_sequences,
            num_beams=config.beam_size,
            do_sample=(config.temperature > 0),
            #use_cache=False,  # Required for flash_attention_2 compatibility
            **kwargs
        )

        # Attention weights not available in generate() mode
        attention_dummy = {}

        # Remove input prompt tokens from output
        input_len = input_tokens["input_ids"].shape[1]
        generated_ids = output[:, input_len:]

        # Generate dummy scores since they're not available
        scores_dummy = torch.zeros(
            generated_ids.shape[0],
            device=self.device
        )

        return InferenceResult(
            tokens=generated_ids,
            scores=scores_dummy,
            attention=attention_dummy
        )

    def generate_from_text(
        self,
        source_code: str,
        source_lang: str,
        target_lang: str,
        config: Optional[InferenceConfig] = None
    ) -> str:
        """High-level interface for text-to-text generation.

        Args:
            source_code: Source assembly code as text
            source_lang: Source assembly language name
            target_lang: Target assembly language name
            config: Optional inference configuration

        Returns:
            Generated target assembly code as string
        """
        prompt = self.prepare_prompt(source_code, source_lang, target_lang)
        tokens = self.tokenize(prompt)
        result = self.infer(tokens, config=config)
        decoded_str = self.decode(result.tokens)

        # Очищаем форматированный блок кода в ответе
        cleaned = decoded_str.split("```armasm\n")[-1].split("```")[0].strip()
        return cleaned