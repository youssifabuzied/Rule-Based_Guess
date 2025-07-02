import os
import traceback
import torch
from datasets import load_dataset
from src.helpers.model import ModelConfig
from src.helpers.dataset import DatasetInstance
from src.domain.models.QwenModel import QwenModel

# Model setup
model_name = "ahmedheakl/gg-armv8-O2"
model = QwenModel(model_name)

config = ModelConfig(
    name="asm2asm-armv8-converter",
    architecture="Qwen",
    temperature=0,
    max_length=2048,
    num_return_sequences=1,
    num_beams=1,
)

# --- Configurable Parameters ---
DONE_FILE = "done.txt"
MAX_INSTANCES_PER_RUN = 200
START_INDEX = 12  # <== Change this to your desired row number
# -------------------------------

# Load dataset
dataset = load_dataset("ahmedheakl/gg-bench-armv8-O2", split="train")

# Resume support
completed = set()
if os.path.exists(DONE_FILE):
    with open(DONE_FILE, "r") as f:
        completed = set(line.strip() for line in f.readlines())

processed_count = 0

# Start from the desired index
for i in range(START_INDEX, len(dataset)):
    row = dataset[i]
    try:
        problem_path = row["file"]

        if problem_path in completed:
            continue
        if processed_count >= MAX_INSTANCES_PER_RUN:
            break

        x86_code = row.get("x86", "").strip()
        if not x86_code:
            print(f"[SKIPPED] Empty x86 code for: {problem_path}")
            continue

        s_file_path = problem_path.replace("code.c", "new_code.s")
        os.makedirs(os.path.dirname(s_file_path), exist_ok=True)

        instance = DatasetInstance(
            instance_id=problem_path,
            source=x86_code,
            source_lang="x86",
            target_lang="ARMv8",
            target=""
        )

        print(f"[INFO] Translating ({i}) {problem_path}...")

        result = model.predict(instance, config)
        decoded_output = model.decode(result.pred.unsqueeze(0)).strip()

        with open(s_file_path, "w") as f:
            f.write(decoded_output + "\n")

        with open(DONE_FILE, "a") as f:
            f.write(problem_path + "\n")

        print(f"[OK] Wrote ARM code to {s_file_path}")
        processed_count += 1

        torch.cuda.empty_cache()

    except Exception as e:
        print(f"[ERROR] Failed on row {i} — {row.get('file', '[unknown]')}")
        print(traceback.format_exc())
        torch.cuda.empty_cache()
