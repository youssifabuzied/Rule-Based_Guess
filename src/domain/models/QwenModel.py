"""Implementation of Qwen-based assembly transpiler model."""

import logging
import time
from functools import wraps
from typing import Dict, List, Optional, Union, Any, Callable, TypeVar

import torch
import warnings
from torch.types import Device
from tqdm.auto import tqdm
from transformers import AutoModelForCausalLM, AutoTokenizer
from transformers.models import deberta

from src.helpers.model import Model, InferenceConfig, InferenceResult

logger = logging.getLogger(__name__)

T = TypeVar('T')

def measure_time(description: str) -> Callable:
    """Decorator to measure execution time of methods.
    
    Args:
        description: Description of the operation being timed
    """
    def decorator(func: Callable[..., T]) -> Callable[..., T]:
        @wraps(func)
        def wrapper(*args, **kwargs) -> T:
            start_time = time.time()
            result = func(*args, **kwargs)
            elapsed_time = time.time() - start_time
            logger.info(f"{description} completed in {elapsed_time:.2f} seconds")
            return result
        return wrapper
    return decorator


class QwenModel(Model):
    """Concrete implementation of Qwen-based assembly transpiler model.
    
    This class implements the Model interface using the Qwen architecture,
    specifically optimized for assembly code translation tasks.
    
    Attributes:
        model: The underlying Qwen model
        tokenizer: Tokenizer for text processing
        device: Device the model is loaded on
    """

    def __init__(self, model_name: str, device: Optional[str] = "auto"):
        """Initialize Qwen model and tokenizer.
        
        Args:
            model_name: Huggingface model ID or local checkpoint path.
            device: device_map argument for loading models (usually "auto").
        """
        logger.info(f"Initializing QwenModel with {model_name} on device {device}")
        
        start_time = time.time()
        with tqdm(total=3, desc="Model Initialization") as pbar:
            # Load model
            self.model = AutoModelForCausalLM.from_pretrained(
                model_name,
                torch_dtype=torch.bfloat16,
                device_map="auto",
            ).to(torch.device(device))
            pbar.update(1)
            
            # Load tokenizer
            tokenizer = AutoTokenizer.from_pretrained(model_name)
            pbar.update(1)
            
            # Setup model
            device_resolved = self.model.device
            super().__init__(tokenizer, device=device_resolved)
            self.model.eval()
            
            # Suppress pad_token_id warnings
            warnings.filterwarnings(
                "ignore",
                category=UserWarning,
                message=".*pad_token_id*"
            )
            pbar.update(1)
        
        elapsed_time = time.time() - start_time
        logger.info(f"Model initialization completed in {elapsed_time:.2f} seconds")

    @measure_time("Prompt preparation")
    def prepare_prompt(self, source_code: str, source_lang: str, target_lang: str) -> str:
        """Prepare system/user prompt for chat-based inference.
        
        Args:
            source_code: Source assembly code
            source_lang: Source ISA name
            target_lang: Target ISA name
            
        Returns:
            Formatted chat prompt for the model
        """
        logger.debug(f"Preparing prompt for {source_lang} -> {target_lang} conversion")
        logger.debug(f"Source code length: {len(source_code)} characters")
        
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

    @measure_time("Tokenization")
    def tokenize(self, text: Union[str, List[str]], **kwargs) -> Dict[str, torch.Tensor]:
        """Tokenize input text and move tensors to model device.
        
        Args:
            text: Input text or list of texts to tokenize
            **kwargs: Additional tokenizer arguments
            
        Returns:
            Dict containing input_ids and attention_mask
        """
        logger.debug(f"Tokenizing text{'s' if isinstance(text, list) else ''} "
                    f"of length: {len(text) if isinstance(text, str) else len(text[0])}")
        
        tokens = self.tokenizer(
            text, return_tensors="pt", padding=True, truncation=True, **kwargs
        ).to(self.device)
        
        logger.debug(f"Tokenized shape: {tokens['input_ids'].shape}")
        return tokens

    @measure_time("Token decoding")
    def decode(self, token_ids: torch.Tensor, **kwargs) -> Union[str, List[str]]:
        """Decode generated tokens back to text.
        
        Args:
            token_ids: Tensor of token IDs to decode
            **kwargs: Additional decoding arguments
            
        Returns:
            Decoded string or list of strings
        """
        logger.debug(f"Decoding tensor of shape: {token_ids.shape}")
        
        # Handle scalar tensors by unsqueezing to add batch dimension
        if len(token_ids.shape) == 0:
            token_ids = token_ids.unsqueeze(0).unsqueeze(0)  # Add batch and sequence dimensions
        elif len(token_ids.shape) == 1:
            token_ids = token_ids.unsqueeze(0)  # Add batch dimension
            
        decoded = self.tokenizer.batch_decode(token_ids, skip_special_tokens=True, **kwargs)
        result = decoded[0] if token_ids.shape[0] == 1 else decoded
        
        logger.debug(f"Decoded text length: {len(result) if isinstance(result, str) else len(result[0])}")
        return result

    # @measure_time("Model inference")
    def infer(
        self,
        input_tokens: Dict[str, torch.Tensor],
        config: Optional[InferenceConfig] = None,
        **kwargs
    ) -> InferenceResult:
        """Perform inference on prepared input tokens.
        
        Args:
            input_tokens: Dict with input_ids and attention_mask
            config: Optional inference configuration
            **kwargs: Additional model-specific arguments
            
        Returns:
            InferenceResult with generated tokens and metadata
        """
        if config is None:
            config = InferenceConfig()
            
        logger.info(f"Starting inference with temperature={config.temperature}, "
                    f"max_length={config.max_length}")
        logger.info(f"Input shape: {input_tokens['input_ids'].shape}")
        
        output = self.model.generate(
            **input_tokens,
            max_new_tokens=config.max_length,
            temperature=config.temperature,
            do_sample=(config.temperature > 0),
            **kwargs
        )

        logger.info(f"Generated shape: {output.shape}")
        
        # Remove input prompt tokens from output
        input_len = input_tokens["input_ids"].shape[1]
        generated_ids = output[:, input_len:]
        
        # Generate dummy scores and attention (not available in generate mode)
        # Create scores for each token in the sequence
        scores_dummy = torch.zeros_like(generated_ids, dtype=torch.float, device=self.device)
        attention_dummy = {}
        
        result = InferenceResult(
            tokens=generated_ids,
            scores=scores_dummy,
            attention=attention_dummy
        )
        
        logger.info(f"Generated {generated_ids.shape[1]} new tokens")
        return result

    @measure_time("Complete generation pipeline")
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
        logger.info(f"Starting {source_lang} -> {target_lang} code generation")
        
        with tqdm(total=4, desc="Generation Pipeline") as pbar:
            # Step 1: Prepare prompt
            prompt = self.prepare_prompt(source_code, source_lang, target_lang)
            pbar.update(1)
            
            # Step 2: Tokenize
            tokens = self.tokenize(prompt)
            pbar.update(1)
            
            # Step 3: Generate
            result = self.infer(tokens, config=config)
            pbar.update(1)
            
            # Step 4: Decode and clean
            decoded_str = self.decode(result.tokens)
            cleaned = decoded_str.split(f"```{target_lang.lower()}asm\n")[-1].split("```")[0].strip()
            pbar.update(1)
        
        logger.info(f"Generation completed. Output length: {len(cleaned)} characters")
        return cleaned