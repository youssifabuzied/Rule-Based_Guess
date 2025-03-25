"""Model interface for assembly code transpilation.

This module defines the abstract base class for ML/AI models that perform
assembly code transpilation. It provides a generic interface for inference,
tokenization, decoding, and prompt preparation.
"""

from abc import ABC, abstractmethod
from dataclasses import dataclass
from typing import Dict, List, Optional, Union
import torch
from transformers import PreTrainedTokenizer


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

    @abstractmethod
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
    def tokenize(self, text: Union[str, List[str]], **kwargs) -> Dict[str, torch.Tensor]:
        """Tokenize input text.

        Args:
            text: Input text or list of texts to tokenize
            **kwargs: Additional tokenizer arguments

        Returns:
            Dict containing input_ids, attention_mask, etc.
        """
        pass

    @abstractmethod
    def decode(self, token_ids: torch.Tensor, **kwargs) -> Union[str, List[str]]:
        """Decode token IDs back to text.

        Args:
            token_ids: Tensor of token IDs to decode
            **kwargs: Additional decode args

        Returns:
            Decoded string or list of strings
        """
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
        pass