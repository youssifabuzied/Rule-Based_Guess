#!/usr/bin/env python3
"""Entry point for running the Guess module."""

from src.guess.guess import ConfigType, Guess
from src.domain.datasets.UnixCommandDataset import UnixCommandDataset  # Register dataset

if __name__ == "__main__":
    guess = Guess(ConfigType.QWEN_X862ARM64)  # Using QWEN model for ARM to x86 translation
    print(f"Source JSONL: {guess.data_loader.dataset.source_lang}")
    print(f"Target JSONL: {guess.data_loader.dataset.target_lang}")
    print(f"Number of instances: {len(guess.data_loader.dataset._instances)}")
    for idx, datapoint in enumerate(guess.data_loader.dataset._instances):
        # datapoint — это DatasetInstance, переводим в dict
        datapoint_dict = {
            "source": datapoint.metadata["source_file"],
            f"{datapoint.source_lang.value}_fns": {"main": datapoint.source},  # если у тебя не функции, а целый блок
            f"{datapoint.target_lang.value}_fns": {"main": datapoint.target},
            f"{datapoint.source_lang.value}_cloze": datapoint.source  # опционально
        }

        result = guess.guess(datapoint_dict)
        if result:
            print(f"[{idx + 1}] Transpiled and saved: {datapoint.metadata['source_file']}")
        else:
            print(f"[{idx + 1}] Skipped (already exists): {datapoint.metadata['source_file']}")

    print("Inference complete.")
