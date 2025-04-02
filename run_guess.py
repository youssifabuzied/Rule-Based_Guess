#!/usr/bin/env python3
"""Entry point for running the Guess module."""

from src.guess.guess import ConfigType, Guess
from src.domain.datasets.UnixCommandDataset import UnixCommandDataset  # Register dataset
from src.domain.datasets.ProjectEulerDataset import ProjectEulerDataset  # Register dataset

if __name__ == "__main__":
    guess = Guess(ConfigType.QWEN_X862ARM64)  # Using QWEN model for ARM to x86 translation
    predictions = guess.guess()
    print("Inference complete.")
    metrics = guess.evaluate(predictions)
    print("Evaluation complete.")
    print(metrics)
