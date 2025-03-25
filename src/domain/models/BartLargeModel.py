"""Implementation of BART-based sequence-to-sequence model for assembly transpilation."""

from typing import Dict, List, Optional, Union

import torch
from transformers import AutoModelForSeq2SeqLM, AutoTokenizer

from src.helpers.model import Model, InferenceConfig, InferenceResult


class BartLargeModel(Model):
    """Implementation of BART-based transpiler model.
    
    This class implements the Model interface using the BART architecture,
    which is well-suited for sequence-to-sequence tasks like assembly
    code translation. BART uses a bidirectional encoder and autoregressive
    decoder architecture.
    """

    def __init__(
        self,
        model_name: str,
        device: Optional[str] = "cuda" if torch.cuda.is_available() else "cpu"
    ):
        """Initialize BART model and tokenizer.
        
        Args:
            model_name: Hugging Face model ID or local checkpoint path
            device: Device to place model on (cuda/cpu)
        """
        self.model = AutoModelForSeq2SeqLM.from_pretrained(model_name).to(device)
        tokenizer = AutoTokenizer.from_pretrained(model_name)
        tokenizer.padding_side = "right"
        tokenizer.pad_token = tokenizer.eos_token
        super().__init__(tokenizer, device=device)
        self.model.eval()

    def prepare_prompt(
        self,
        source_code: str,
        source_lang: str,
        target_lang: str
    ) -> str:
        """Prepare text prompt for BART model.
        
        Unlike chat-based models, BART uses a simple cloze-style input format.
        
        Args:
            source_code: Source assembly code
            source_lang: Source assembly language
            target_lang: Target assembly language
            
        Returns:
            Formatted prompt string
        """
        return f"Translate from {source_lang} to {target_lang}:\n{source_code.strip()}"

    def tokenize(
        self,
        text: Union[str, List[str]],
        **kwargs
    ) -> Dict[str, torch.Tensor]:
        """Tokenize input text and move tensors to device.
        
        Args:
            text: Input text or list of texts to tokenize
            **kwargs: Additional tokenizer arguments
            
        Returns:
            Dict containing tokenized tensors on target device
        """
        return self.tokenizer(
            text,
            return_tensors="pt",
            padding=True,
            truncation=True,
            **kwargs
        ).to(self.device)

    def decode(
        self,
        token_ids: torch.Tensor,
        **kwargs
    ) -> Union[str, List[str]]:
        """Decode token IDs back to text.
        
        Args:
            token_ids: Tensor of token IDs to decode
            **kwargs: Additional decoding arguments
            
        Returns:
            Single string if batch size is 1, otherwise list of strings
        """
        decoded = self.tokenizer.batch_decode(
            token_ids,
            skip_special_tokens=True,
            **kwargs
        )
        if token_ids.shape[0] == 1:
            return decoded[0]
        return decoded

    def infer(
        self,
        input_tokens: Dict[str, torch.Tensor],
        config: Optional[InferenceConfig] = None,
        **kwargs
    ) -> InferenceResult:
        """Perform inference using BART seq2seq model.
        
        Args:
            input_tokens: Dict containing input_ids and attention_mask
            config: Optional inference configuration
            **kwargs: Additional generation arguments
            
        Returns:
            InferenceResult containing generated tokens and metadata
        """
        if config is None:
            config = InferenceConfig()

        outputs = self.model.generate(
            input_ids=input_tokens["input_ids"],
            attention_mask=input_tokens.get("attention_mask"),
            max_new_tokens=config.max_length,
            temperature=config.temperature,
            num_return_sequences=config.num_return_sequences,
            num_beams=config.beam_size,
            do_sample=(config.temperature > 0),
            output_attentions=False,  # В generate attention не возвращается, только при forward
            **kwargs
        )

        # Attention карты можно получить только при forward, если это понадобится — можно отдельно добавить метод.
        dummy_attention = {}

        # Счётчик оценок отсутствует, можно заполнить нулями
        dummy_scores = torch.zeros(outputs.shape[0], device=self.device)

        return InferenceResult(
            tokens=outputs,
            scores=dummy_scores,
            attention=dummy_attention
        )

    def generate_from_text(
        self,
        source_code: str,
        source_lang: str,
        target_lang: str,
        config: Optional[InferenceConfig] = None
    ) -> str:
        """High-level API call: takes text, runs inference, returns text."""
        prompt = self.prepare_prompt(source_code, source_lang, target_lang)
        tokens = self.tokenize(prompt)
        result = self.infer(tokens, config=config)
        decoded_str = self.decode(result.tokens)
        return decoded_str.strip()