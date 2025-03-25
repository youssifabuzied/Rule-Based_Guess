"""Dataset module for assembly code transpilation tasks."""

from abc import ABC, abstractmethod
from dataclasses import dataclass
from enum import Enum, auto
import json
from typing import Any, ClassVar, Dict, List, Optional, Union
import logging


class AssemblyLanguage(Enum):
    """Supported assembly languages for transpilation."""
    RISCV = 'riscv'
    X86 = 'x86'
    ARM64 = 'arm64'
    MIPS = 'mips'
    
    @classmethod
    def from_str(cls, name: str) -> 'AssemblyLanguage':
        """Create AssemblyLanguage from string name."""
        try:
            return cls[name.upper()]
        except KeyError:
            raise ValueError(
                f"Unknown assembly language: {name}. "
                f"Supported languages: {[l.value for l in cls]}")


@dataclass
class DatasetConfig:
    """Configuration for dataset initialization.
    
    Attributes:
        source_lang: Source assembly language
        target_lang: Target assembly language
        dataset_name: Name of the dataset
        batch_size: Number of samples per batch
        evaluation_metrics: List of metrics to compute
    """
    source_lang: str
    target_lang: str
    dataset_name: str
    batch_size: int = 32
    evaluation_metrics: List[str] = None
    metadata: Optional[Dict[str, Any]] = None
    
    @classmethod
    def from_file(cls, config_path: str) -> 'DatasetConfig':
        """Load configuration from JSON file."""
        with open(config_path, 'r') as f:
            config = json.load(f)
        return cls(**config)


@dataclass
class DatasetInstance:
    """Represents a single assembly code transpilation instance.
    
    Attributes:
        instance_id: Unique identifier for this instance
        source_lang: Source assembly language
        target_lang: Target assembly language for transpilation
        source: Source assembly code
        target: Target assembly code (ground truth)
        metadata: Additional information about this instance
    """
    instance_id: str
    source_lang: AssemblyLanguage
    target_lang: AssemblyLanguage
    source: str
    target: str
    metadata: Optional[Dict[str, str]] = None


class Dataset(ABC):
    """Abstract base class for assembly code datasets.
    
    This class defines the interface for loading and evaluating assembly code data
    for transpilation between different architectures.
    
    Attributes:
        config: Dataset configuration
        source_lang: Source assembly language
        target_lang: Target assembly language
        logger: Logger instance for this class
    """
    # Registry of dataset implementations
    _registry: ClassVar[Dict[str, type]] = {}
    
    def __init__(self, config: DatasetConfig):
        """Initialize dataset.
        
        Args:
            config: Dataset configuration
        """
        self.config = config
        self.source_lang = AssemblyLanguage.from_str(config.source_lang)
        self.target_lang = AssemblyLanguage.from_str(config.target_lang)
        self.logger = logging.getLogger(__name__)
        self._instances: List[DatasetInstance] = []
    
    @classmethod
    def register(cls, name: str):
        """Register a dataset implementation."""
        def decorator(subclass: type) -> type:
            cls._registry[name] = subclass
            return subclass
        return decorator
    
    @classmethod
    def from_config(cls, config: Union[str, Dict[str, Any], DatasetConfig]) -> 'Dataset':
        """Create a dataset instance from configuration.
        
        Args:
            config: Either a path to config file, a config dict, or DatasetConfig instance
            
        Returns:
            Initialized dataset instance
        """
        if isinstance(config, str):
            config = DatasetConfig.from_file(config)
        elif isinstance(config, dict):
            config = DatasetConfig(**config)
        
        if config.dataset_name not in cls._registry:
            raise ValueError(
                f"Unknown dataset type: {config.dataset_name}. "
                f"Registered types: {list(cls._registry.keys())}")
        
        return cls._registry[config.dataset_name](config)
    
    @abstractmethod
    def load_data(self) -> List[DatasetInstance]:
        """Load and preprocess assembly code data.
        
        Returns:
            List of DatasetInstance objects containing source and target code
        """
        pass
    
    @abstractmethod
    def evaluate(self, predictions: List[List[str]]) -> Dict[str, float]:
        """Evaluate the quality of transpiled assembly code.
        
        This method computes metrics specified in the configuration to assess
        transpilation quality. Default metrics include:
        1. Instruction accuracy
        2. Function structure similarity
        3. Register usage accuracy
        
        Args:
            predictions: List of batches of predicted assembly code strings
            
        Returns:
            Dictionary of metric names to values
        """
        pass

        