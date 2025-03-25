"""Assembly code transpilation prediction module.

This module provides functionality for generating and managing assembly code
translations using configurable models. It supports multiple model types and
handles both function-level and cloze-style translations.
"""

import gc
import json
from enum import Enum
from pathlib import Path
from typing import Dict

import torch

from src.config import Config
from src.helpers.model import Model, InferenceConfig
from src.domain.models.QwenModel import QwenModel
from src.domain.models.BartLargeModel import BartLargeModel
from src.helpers.dataset import Dataset, DatasetConfig
from src.helpers.data_loader import DataLoader


class ConfigType(str, Enum):
    """Available configuration types for transpilation models.
    
    Each enum value corresponds to a launch spec file in the configs directory.
    The file path is constructed by appending '.yaml' to the enum value.
    """
    QWEN_X862ARM64 = "launch_spec_qwen"
    BART_RISC2ARM = "launch_spec_bart"

    def get_path(self) -> Path:
        """Get full path to the YAML configuration file.
        
        Returns:
            Path to the configuration file in the configs directory
        """
        return Path(__file__).parent.parent.parent / "configs" / f"{self.value}.yaml"


class Guess:
    """Handles generation of assembly code translations.
    
    This class manages the lifecycle of model initialization, data loading,
    and inference for assembly code translation. It supports both function-level
    translations and cloze-style predictions.
    
    The class uses a configuration-driven approach where model type, inference
    parameters, and data settings are loaded from YAML config files.
    """
    def __init__(self, config_type: ConfigType) -> None:
        """Initialize the Guess instance.
        
        Args:
            config_type: Type of configuration to use for model and inference
        
        Raises:
            ValueError: If the model type specified in config is not supported
        """
        self.config = Config(config_type.get_path())

        # Initialize model based on configuration
        model_name = self.config.model_name.lower()
        if "qwen" in model_name:
            print(f"Loading Qwen model: {self.config.model_name}")
            self.model: Model = QwenModel(model_name=self.config.model_name)
        elif "bart" in model_name:
            print(f"Loading BART model: {self.config.model_name}")
            self.model: Model = BartLargeModel(model_name=self.config.model_name)
        else:
            raise ValueError(f"Unknown model type in {self.config.model_name}")

        self.is_enc_dec = self.config.is_enc_dec
        # Setup predictions directory
        self.predictions_folder = Path(self.config.artifacts_path) / "predictions"
        self.predictions_folder.mkdir(parents=True, exist_ok=True)

        # Configure inference parameters
        self.inference_cfg = InferenceConfig(
            beam_size=self.config.inference_params.get("beam_size", 5),
            temperature=self.config.inference_params.get("temperature", 0.7),
            max_length=self.config.model_max_length,
            num_return_sequences=self.config.inference_params.get("num_guesses", 5)
        )

        # Initialize dataset and data loader
        dataset_config = DatasetConfig(
            source_lang=self.config.source_lang,
            target_lang=self.config.target_lang,
            dataset_name=self.config.dataset_name,
            batch_size=self.config.inference_params.get("batch_size", 32),
            evaluation_metrics=["compilation"]
        )
        dataset = Dataset.from_config(dataset_config)
        dataset._instances = dataset.load_data()

        # Configure data loader with chunking for encoder-decoder models
        self.data_loader = DataLoader.from_dataset(
            dataset=dataset,
            batch_size=dataset_config.batch_size,
            enable_chunking=self.is_enc_dec  # Enable chunking for enc-dec models
        )
        print(f"Number of instances: {len(self.data_loader.dataset._instances)}")

    def guess(self, datapoint: Dict) -> Dict:
        """Generate translation candidates for a datapoint.
        
        Args:
            datapoint: Dictionary containing source code and metadata including:
                - source: Source file name
                - c: Optional C source code
                - {source_lang}_fns: Functions to translate
                - {source_lang}_cloze: Optional cloze task content
        
        Returns:
            Dictionary containing translation predictions and metadata, or empty dict
            if predictions already exist
        """
        # Check if predictions already exist
        progname = datapoint["source"].split(".c")[0]
        pred_file = self.predictions_folder / f"guess_{progname}.json"
        if pred_file.exists():
            return {}

        # Initialize prediction structure
        prediction_result = {
            "source_file": datapoint["source"],
            "c_code": datapoint.get("c", ""),
            f"src_{self.config.source_lang}": {
                "functions": {},
                "cloze": datapoint.get(f"{self.config.source_lang}_cloze", "")
            },
            f"tgt_{self.config.target_lang}": {
                "functions": {},
                "cloze_candidates": []
            }
        }
        print(f"Processing {datapoint['source']}...")
        with torch.no_grad():
            # Process each function in the source code
            for fn_name, src_chunk in datapoint[f"{self.config.source_lang}_fns"].items():
                # Generate translation candidates
                print(f"  Translating {fn_name}...")
                prompt = self.model.prepare_prompt(
                    src_chunk,
                    self.config.source_lang,
                    self.config.target_lang
                )
                print(f"    Prompt: {prompt}")
                batch = self.model.tokenize(prompt)
                result = self.model.infer(batch, config=self.inference_cfg)
                print(f"    Result: {result}")
                # Process and score candidates
                candidates = [
                    {
                        "tokens": seq.tolist(),
                        "decoded": self.model.decode(seq),
                        "score": score.item()
                    }
                    for seq, score in zip(result.tokens, result.scores)
                ]

                # Store sorted candidates
                prediction_result[f"tgt_{self.config.target_lang}"]["functions"][fn_name] = {
                    "candidates": sorted(candidates, key=lambda x: x["score"], reverse=True)
                }

                # Clean up GPU memory
                gc.collect()
                torch.cuda.empty_cache()

            # Handle cloze-style translation if present
            if f"{self.config.source_lang}_cloze" in datapoint:
                cloze_src = datapoint[f"{self.config.source_lang}_cloze"]
                prompt = self.model.prepare_prompt(
                    cloze_src,
                    self.config.source_lang,
                    self.config.target_lang
                )
                print(f"    Prompt: {prompt}")
                batch = self.model.tokenize(prompt)
                result = self.model.infer(batch, config=self.inference_cfg)

                # Process cloze candidates
                cloze_candidates = [
                    {
                        "tokens": seq.tolist(),
                        "decoded": self.model.decode(seq),
                        "score": score.item()
                    }
                    for seq, score in zip(result.tokens, result.scores)
                ]

                # Store sorted cloze candidates
                prediction_result[f"tgt_{self.config.target_lang}"]["cloze_candidates"] = sorted(
                    cloze_candidates, key=lambda x: x["score"], reverse=True
                )

        # Save predictions to file
        with open(pred_file, "w") as f:
            json.dump(prediction_result, f, indent=4)

        return prediction_result


