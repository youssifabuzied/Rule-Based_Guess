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
    QWEN_EULER_ARM2RISC = "launch_spec_qwen_euler_arm2risc"
    QWEN_EULER_RISC2ARM = "launch_spec_qwen_euler_risc2arm"

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
            self.model: Model = QwenModel(model_name=self.config.model_name, device="cpu")
        elif "bart" in model_name:
            print(f"Loading BART model: {self.config.model_name}")
            self.model: Model = BartLargeModel(model_name=self.config.model_name, device="mps")
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
        self.dataset = Dataset.from_config(dataset_config)

        # Configure data loader with chunking for encoder-decoder models
        self.data_loader = DataLoader.from_dataset(
            dataset=self.dataset,
            batch_size=dataset_config.batch_size,
            enable_chunking=self.is_enc_dec  # Enable chunking for enc-dec models
        )
        print(f"Number of instances: {len(self.data_loader.dataset._instances)}")

    def guess(self) -> Dict[str, Dict]:
        """Generate translation candidates for all datapoints using batch processing.
        
        Returns:
            Dictionary mapping source files to their prediction results
        """
        all_predictions = {}

        # Process all batches
        for batch in self.data_loader.iter_batches():
            for datapoint in batch:
                # Skip if predictions already exist
                progname = datapoint.instance_id
                pred_file = self.predictions_folder / f"guess_{progname}.json"
                target_file = self.predictions_folder / f"guess_{progname}_{self.config.target_lang}.s"

                if pred_file.exists():
                    continue

                # Initialize prediction structure
                prediction_result = {
                    "source_file": datapoint.source,
                    "c_code": "",  # No C code in assembly dataset
                    f"src_{self.config.source_lang}": {
                        "functions": {},
                        "cloze": ""  # No cloze predictions for assembly
                    },
                    f"tgt_{self.config.target_lang}": {
                        "functions": {},
                        "cloze_candidates": []
                    }
                }
                print(f"Processing {datapoint.source}...")

                # For assembly code, we treat the entire source as one function
                function_prompts = [
                    ("main", self.model.prepare_prompt(
                        datapoint.source,
                        self.config.source_lang,
                        self.config.target_lang
                    ))
                ]

                # Process prompts in batches
                with torch.no_grad():
                    for batch_start in range(0, len(function_prompts), self.data_loader.batch_size):
                        batch_prompts = function_prompts[batch_start:batch_start + self.data_loader.batch_size]
                        batch_names, prompts = zip(*batch_prompts)
                        
                        # Tokenize and run inference on batch
                        print(f"  Processing batch of {len(prompts)} prompts...")
                        print(prompts)
                        batch = self.model.tokenize(list(prompts))
                        print(f"  Tokenized batch")
                        result = self.model.infer(batch, config=self.inference_cfg)
                        print(f"  Inferred batch")

                        # Process results for each item in batch
                        for idx, (name, tokens, scores) in enumerate(zip(batch_names, result.tokens, result.scores)):
                            candidates = [
                                {
                                    "tokens": seq.tolist(),
                                    "decoded": self.model.decode(seq),
                                    "score": score.item()
                                }
                                for seq, score in zip(tokens, scores)
                            ]


                            if name == "__cloze__":
                                prediction_result[f"tgt_{self.config.target_lang}"]["cloze_candidates"] = candidates
                            else:
                                prediction_result[f"tgt_{self.config.target_lang}"]["functions"][name] = {
                                    "candidates": candidates,
                                    f"{self.config.target_lang}_tokens": "".join([ c["decoded"] for c in candidates ]).strip("```armasm\n").strip("```"),
                                }
                            print(f"    Processed {name} with {len(candidates)} candidates")

                        # Clean up GPU memory after each batch
                        gc.collect()
                        torch.cuda.empty_cache()

                # Create directory structure and save predictions to file
                pred_file.parent.mkdir(parents=True, exist_ok=True)
                with open(pred_file, "w") as f:
                    json.dump(prediction_result, f, indent=2)
                with open(target_file, "w") as f:
                    f.write(
                        prediction_result[f"tgt_{self.config.target_lang}"]["functions"]["main"][f"{self.config.target_lang}_tokens"]
                    )

                # Store in all_predictions
                all_predictions[datapoint.instance_id] = prediction_result

        return all_predictions

    def evaluate(self, predictions: Dict[str, Dict]) -> Dict[str, float]:
        return self.dataset.evaluate(predictions)
