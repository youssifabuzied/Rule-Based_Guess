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
    batch_size: Optional[int] = None
    min_func_lines: int = 3
    max_func_lines: int = 500
    enable_chunking: bool = False
    chunk_size: int = 200
    chunk_overlap: int = 20

    # Internal state fields
    _data: List[DatasetInstance] = field(default_factory=list)
    _current_index: int = field(default=0, init=False)
    _logger: logging.Logger = field(init=False)
    _preprocessor: AssemblyPreprocessor = field(init=False)

    @classmethod
    def from_dataset(
        cls,
        dataset: Dataset,
        batch_size: Optional[int] = None,
        enable_chunking: bool = False
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
            batch_size=batch_size,
            enable_chunking=enable_chunking
        )

    def __post_init__(self):
        """Initialize logger and preprocessor after dataclass initialization."""
        self._logger = logging.getLogger(__name__)
        self._preprocessor = AssemblyPreprocessor(
            min_func_lines=self.min_func_lines,
            max_func_lines=self.max_func_lines
        )
    def get_batch(self) -> Optional[List[DatasetInstance]]:
        """Get the next batch of samples.
        
        Returns:
            List of DatasetInstance objects for the batch,
            or None if no more batches are available
        """
        if not self._data:
            raw_data = self.dataset.load_data()
            self._data = self._preprocess_instances(raw_data)
            self._current_index = 0
            self._logger.info(f"Loaded {len(self._data)} samples from dataset")

        if self._current_index >= len(self._data):
            return None

        end_idx = self._current_index + (self.batch_size or self.dataset.config.batch_size)
        batch = self._data[self._current_index:end_idx]
        self._current_index = end_idx
        return batch

    def _preprocess_instances(self, instances: List[DatasetInstance]) -> List[DatasetInstance]:
        """Preprocess assembly code in dataset instances.
        
        Args:
            instances: List of raw dataset instances
            
        Returns:
            List of preprocessed dataset instances
        """
        start = perf_counter()
        processed = []

        for inst in instances:
            print(inst.instance_id)
            # Create unique paths for source and target files
            safe_id = inst.instance_id.replace('/', '_')
            tmp_dir = Path(tempfile.gettempdir()) / "UnixCommands" / safe_id
            tmp_dir.mkdir(parents=True, exist_ok=True)
            src_path = tmp_dir / f"{safe_id}_src.s"
            tgt_path = tmp_dir / f"{safe_id}_tgt.s"

            try:
                # Write assembly to temp files
                src_path.write_text(inst.source)
                if inst.target:
                    tgt_path.write_text(inst.target)

                # Preprocess source code
                src_funcs = self._preprocessor.preprocess_file(src_path)
                if not src_funcs:
                    continue

                # Preprocess target if available
                tgt_funcs = None
                if inst.target:
                    tgt_funcs = self._preprocessor.preprocess_file(tgt_path)
                    if not tgt_funcs:
                        continue

                # Process each source function
                for src_func in src_funcs:
                    if self.enable_chunking and len(src_func['code'].splitlines()) > self.chunk_size:
                        # Split large functions into chunks
                        chunks = self._chunk_function(src_func['code'])
                        for idx, chunk in enumerate(chunks):
                            chunk_inst = DatasetInstance(
                                instance_id=f"{inst.instance_id}_chunk{idx}",
                                source_lang=inst.source_lang,
                                target_lang=inst.target_lang,
                                source=chunk,
                                target=None,  # Target not chunked
                                metadata={"original_function": src_func['name']}
                            )
                            processed.append(chunk_inst)
                    else:
                        # Process entire function
                        new_inst = DatasetInstance(
                            instance_id=inst.instance_id,
                            source_lang=inst.source_lang,
                            target_lang=inst.target_lang,
                            source=src_func['code'],
                            target=None if tgt_funcs is None else '\n'.join(f['code'] for f in tgt_funcs),
                            metadata={
                                'src_funcs': [f['name'] for f in src_funcs],
                                'tgt_funcs': [f['name'] for f in tgt_funcs] if tgt_funcs else None
                            }
                        )
                        processed.append(new_inst)

            finally:
                # Clean up temp files
                if src_path.exists():
                    src_path.unlink()
                if tgt_path.exists():
                    tgt_path.unlink()

        elapsed = perf_counter() - start
        self._logger.info(
            f"Preprocessed {len(processed)}/{len(instances)} instances "
            f"in {elapsed:.2f} seconds")

        return processed

    def _chunk_function(self, code: str) -> List[str]:
        """Split a function into overlapping chunks.
        
        Args:
            code: Function code to split into chunks
            
        Returns:
            List of code chunks with overlap between adjacent chunks
        """
        lines = code.splitlines()
        chunks = []
        start = 0
        while start < len(lines):
            end = min(start + self.chunk_size, len(lines))
            chunks.append('\n'.join(lines[start:end]))
            start = end - self.chunk_overlap if (end < len(lines)) else end
        return chunks

    def iter_batches(self) -> Iterator[List[DatasetInstance]]:
        """Iterate over all batches in the dataset.
        
        Yields:
            Batches of DatasetInstance objects
        """
        self._current_index = 0
        while True:
            batch = self.get_batch()
            if batch is None:
                break
            yield batch
