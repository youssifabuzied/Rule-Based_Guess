"""Data loader module for assembly code transpilation.

This module provides functionality for loading and preprocessing assembly code
for inference tasks. It includes batch generation and code preprocessing utilities
with support for chunking large functions into smaller segments.
"""

from dataclasses import dataclass, field
from pathlib import Path
from time import perf_counter
from typing import List, Iterator, Optional
import logging
import tempfile

from .dataset import Dataset, DatasetInstance
from src.helpers.preprocess import AssemblyPreprocessor


@dataclass
class DataLoader:
    """Handles batch generation of assembly code for inference.

    This class is responsible for loading data from a Dataset and generating
    batches for inference. It uses the Dataset's preprocessing capabilities
    and supports chunking large functions into smaller segments for processing.

    Attributes:
        dataset: Dataset instance for data loading and evaluation
        batch_size: Number of samples per batch
        min_func_lines: Minimum lines for a valid function
        max_func_lines: Maximum lines for a valid function
        enable_chunking: Whether to split large functions into chunks
        chunk_size: Maximum number of lines per chunk when chunking is enabled
        chunk_overlap: Number of overlapping lines between chunks
    """
    dataset: Dataset

    # Internal state fields
    _data: List[DatasetInstance] = field(default=None)
    _current_index: int = field(default=0, init=False)
    _logger: logging.Logger = field(init=False)

    @classmethod
    def from_dataset(
        cls,
        dataset: Dataset,
    ) -> 'DataLoader':
        """Create a DataLoader from a Dataset instance.

        Args:
            dataset: Dataset instance to load data from
            batch_size: Optional batch size override
            enable_chunking: Whether to enable function chunking

        Returns:
            Initialized DataLoader instance
        """
        return cls(
            dataset=dataset,
        )

    def __post_init__(self):
        """Initialize logger and preprocessor after dataclass initialization."""
        self._logger = logging.getLogger(__name__)

    def iter(self) -> Iterator[DatasetInstance]:
        """Iterate over all batches in the dataset.

        Yields:
            DatasetInstance objects
        """
        if self._data is None:
            self._data = self.dataset.load_data()
            self._current_index = 0
            self._logger.info(f"Loaded {len(self._data)} samples from dataset")

        while self._current_index < len(self._data):
            yield self._data[self._current_index]
            self._current_index += 1
