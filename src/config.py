from datetime import datetime
from pathlib import Path
from typing import Any, Dict

import yaml


class Config:
    """Configuration manager for the GuessSketch model.
    
    Handles loading and managing configuration from YAML files, including model settings,
    inference parameters, language settings, and feature flags.
    """
    
    def __init__(self, config_path: str) -> None:
        """Initialize configuration from a YAML file.
        
        Args:
            config_path: Path to the YAML configuration file
        """
        self.config_path = Path(config_path)
        with open(config_path, "r") as f:
            self._config = yaml.safe_load(f)

        if not self._config.get("run"):
            self._config["run"] = {}

        if self._config["run"].get("timestamp") is None:
            timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
            self._config["run"]["timestamp"] = timestamp
        else:
            timestamp = self._config["run"]["timestamp"]

        model_name = self._config.get("model", {}).get("name", "unknown_model")
        artifacts_base = self._config["run"].get("save_artifacts_path", "artifacts/")
        save_path = Path(artifacts_base) / model_name / timestamp
        save_path.mkdir(parents=True, exist_ok=True)
        self._config["run"]["save_artifacts_path"] = str(save_path)

        # Save the config with populated fields to artifacts
        with open(save_path / "config_used.yaml", "w") as f:
            yaml.dump(self._config, f)

    @property
    def run_name(self) -> str:
        """Get the name of the current run."""
        return self._config["run"]["name"]

    @property
    def run_timestamp(self) -> str:
        """Get the timestamp of the current run."""
        return self._config["run"]["timestamp"]

    @property
    def artifacts_path(self) -> str:
        """Get the path where artifacts are saved."""
        return self._config["run"]["save_artifacts_path"]

    @property
    def model_name(self) -> str:
        """Get the name of the model."""
        return self._config["model"]["name"]

    @property
    def model_checkpoint(self) -> str:
        """Get the path to the model checkpoint."""
        return self._config["model"]["checkpoint"]

    @property
    def model_max_length(self) -> int:
        """Get the maximum sequence length for the model."""
        return self._config["model"]["max_length"]

    @property
    def is_enc_dec(self) -> bool:
        """Check if the model is an encoder-decoder architecture.
        
        Returns:
            bool: True if model is encoder-decoder (e.g. BART), False if decoder-only (e.g. QWEN)
        """
        return self._config["model"].get("is_enc_dec", False)

    @property
    def inference_params(self) -> Dict[str, Any]:
        """Get the inference parameters (beam size, temperature, etc.)."""
        return self._config["inference"]

    @property
    def source_lang(self) -> str:
        """Get the source language code."""
        return self._config["language"]["source_lang"]

    @property
    def target_lang(self) -> str:
        """Get the target language code."""
        return self._config["language"]["target_lang"]

    @property
    def viceversa(self) -> bool:
        """Check if bidirectional translation is enabled."""
        return self._config["language"]["viceversa"]

    @property
    def dataset_name(self) -> str:
        """Get the name of the dataset."""
        return self._config["dataset"]["name"]

    @property
    def gcc_args(self) -> list:
        """Get the GCC compilation arguments."""
        return self._config["dataset"]["gcc_args"]

    @property
    def dataset_notes(self) -> str:
        """Get additional notes about the dataset."""
        return self._config["dataset"]["additional_notes"]

    @property
    def features(self) -> Dict[str, Any]:
        """Get the feature flags configuration."""
        return self._config["features"]

    @property
    def sketch_template_path(self) -> str:
        """Get the path to the sketch template."""
        return self._config["sketch"]["template_path"]

    @property
    def sketch_view_uncertain(self) -> bool:
        """Check if uncertain sketch views are enabled."""
        return self._config["sketch"]["view_uncertain"]

    def to_dict(self) -> Dict[str, Any]:
        """Convert the configuration to a dictionary.
        
        Returns:
            The complete configuration as a dictionary
        """
        return self._config