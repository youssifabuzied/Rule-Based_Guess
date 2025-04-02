"""Model interface for assembly code transpilation.

This module defines the abstract base class for ML/AI models that perform
assembly code transpilation. It provides a generic interface for inference,
tokenization, decoding, and prompt preparation.
"""

import logging
import time
from abc import ABC, abstractmethod
from dataclasses import dataclass
from functools import wraps
from typing import Any, Dict, List, Optional, Union, TypeVar, Callable

import torch
from tqdm.auto import tqdm
from transformers import PreTrainedTokenizer

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

T = TypeVar('T')

def log_execution_time(func: Callable[..., T]) -> Callable[..., T]:
    """Decorator to log function execution time."""
    @wraps(func)
    def wrapper(*args, **kwargs) -> T:
        start_time = time.time()
        result = func(*args, **kwargs)
        elapsed_time = time.time() - start_time
        logger.info(f'{func.__name__} executed in {elapsed_time:.2f} seconds')
        return result
    return wrapper


@dataclass
class InferenceConfig:
    """Configuration for model inference.

    Attributes:
        beam_size: Number of beams for beam search decoding
        temperature: Sampling temperature for generation
        max_length: Maximum length of generated sequence
        num_return_sequences: Number of sequences to return per input
    """
    beam_size: int = 5
    temperature: float = 0.7
    max_length: int = 512
    num_return_sequences: int = 1


@dataclass
class InferenceResult:
    """Results from model inference.

    Attributes:
        tokens: Generated token sequences [batch_size, num_sequences, seq_len]
        scores: Sequence scores [batch_size, num_sequences]
        attention: Attention weights from transformer layers
            {layer_idx: tensor[batch_size, num_heads, tgt_len, src_len]}
    """
    tokens: torch.Tensor
    scores: Optional[torch.Tensor]
    attention: Optional[Dict[int, torch.Tensor]]


class Model(ABC):
    """Abstract base class for assembly transpilation models.

    This class defines the interface that all model implementations must follow.
    """

    def __init__(self, tokenizer: PreTrainedTokenizer, device: Optional[Union[str, torch.device]] = "cpu"):
        """Initialize model with tokenizer and device.

        Args:
            tokenizer: HuggingFace tokenizer for encoding/decoding
            device: device for inference (cpu/cuda or torch.device)
        """
        self.tokenizer = tokenizer
        self.device = device
        self.logger = logging.getLogger(self.__class__.__name__)
        self.logger.info(f"Initialized {self.__class__.__name__} on device: {device}")

    @abstractmethod
    @log_execution_time
    def infer(
        self,
        input_tokens: Dict[str, torch.Tensor],
        config: Optional[InferenceConfig] = None,
        **kwargs
    ) -> InferenceResult:
        """Perform inference on pre-tokenized input tokens.

        Args:
            input_tokens: Dict with input_ids and attention_mask
            config: Optional inference configuration
            **kwargs: Additional model-specific arguments

        Returns:
            InferenceResult with generated tokens, scores and attention
        """
        pass

    @abstractmethod
    @log_execution_time
    def tokenize(self, text: Union[str, List[str]], **kwargs) -> Dict[str, torch.Tensor]:
        """Tokenize input text.

        Args:
            text: Input text or list of texts to tokenize
            **kwargs: Additional tokenizer arguments

        Returns:
            Dict containing input_ids, attention_mask, etc.
        """
        self.logger.debug(f"Tokenizing text of length: {len(text) if isinstance(text, str) else len(text[0])}")
        pass

    @abstractmethod
    @log_execution_time
    def decode(self, token_ids: torch.Tensor, **kwargs) -> Union[str, List[str]]:
        """Decode token IDs back to text.

        Args:
            token_ids: Tensor of token IDs to decode
            **kwargs: Additional decode args

        Returns:
            Decoded string or list of strings
        """
        self.logger.debug(f"Decoding tensor of shape: {token_ids.shape}")
        pass

    @abstractmethod
    def prepare_prompt(
        self,
        source_code: str,
        source_lang: str,
        target_lang: str
    ) -> str:
        """Prepare input prompt for inference (useful for chat-based models).

        Args:
            source_code: Source assembly code
            source_lang: Source ISA name
            target_lang: Target ISA name

        Returns:
            Formatted text prompt
        """
        pass

    @abstractmethod
    @log_execution_time
    def generate_from_text(
        self,
        source_code: str,
        source_lang: str,
        target_lang: str,
        config: Optional[InferenceConfig] = None
    ) -> str:
        """High-level call: input string -> output string.

        Args:
            source_code: Assembly code input as text
            source_lang: Source ISA
            target_lang: Target ISA
            config: Inference settings

        Returns:
            Transpiled target assembly code as string
        """
        self.logger.info(f"Generating from {source_lang} to {target_lang}")
        self.logger.info(f"Input code length: {len(source_code)} characters")
        
        with tqdm(total=3, desc="Generation Progress") as pbar:
            # Step 1: Prepare prompt
            prompt = self.prepare_prompt(source_code, source_lang, target_lang)
            pbar.update(1)
            
            # Step 2: Tokenize
            tokens = self.tokenize(prompt)
            pbar.update(1)
            
            # Step 3: Generate
            result = self.infer(tokens, config)
            decoded = self.decode(result.tokens)
            pbar.update(1)
            
        self.logger.info(f"Generation completed. Output length: {len(decoded) if isinstance(decoded, str) else len(decoded[0])} characters")
        return decoded