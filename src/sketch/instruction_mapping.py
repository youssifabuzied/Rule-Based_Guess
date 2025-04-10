from enum import Enum, auto


class InstructionType(Enum):
    ARITHMETIC = auto()
    MEMORY = auto()
    BRANCHING = auto()
    SYSTEM = auto()  # optional: for things like `nop`, `call`


riscv_mapping = {
    "add":     (InstructionType.ARITHMETIC, "add", None),
    "addi":    (InstructionType.ARITHMETIC, "add", None),
    "addiw":   (InstructionType.ARITHMETIC, "add", None),
    "slli":    (InstructionType.ARITHMETIC, "shift", None),
    "xor":     (InstructionType.ARITHMETIC, "xor", None),
    "sext.w":  (InstructionType.ARITHMETIC, "sign_extend", None),
    "mv":      (InstructionType.ARITHMETIC, "move", None),
    "li":      (InstructionType.ARITHMETIC, "move", None),

    "nop":     (InstructionType.SYSTEM, "nop", None),

    "ld":      (InstructionType.MEMORY, "load", None),
    "lw":      (InstructionType.MEMORY, "load", None),
    "lbu":     (InstructionType.MEMORY, "load", None),
    "sd":      (InstructionType.MEMORY, "store", None),
    "sw":      (InstructionType.MEMORY, "store", None),
    "sb":      (InstructionType.MEMORY, "store", None),
    "lla":     (InstructionType.MEMORY, "load_address", None),
    "la":      (InstructionType.MEMORY, "load_address", None),

    "j":       (InstructionType.BRANCHING, "jump", None),
    "jr":      (InstructionType.BRANCHING, "return", None),
    "call":    (InstructionType.BRANCHING, "call", None),
    "beq":     (InstructionType.BRANCHING, "branch_eq", None),
    "bne":     (InstructionType.BRANCHING, "branch_ne", None),
    "bgt":     (InstructionType.BRANCHING, "branch_gt", None),
}

arm64_mapping = {
    "add":     (InstructionType.ARITHMETIC, "add", None),
    "subs":    (InstructionType.ARITHMETIC, "subtract", None),
    "sub":     (InstructionType.ARITHMETIC, "subtract", None),
    "lsl":     (InstructionType.ARITHMETIC, "shift", None),
    "mov":     (InstructionType.ARITHMETIC, "move", None),

    "nop":     (InstructionType.SYSTEM, "nop", None),

    "ldr":     (InstructionType.MEMORY, "load", None),
    "ldrb":    (InstructionType.MEMORY, "load", None),
    "ldrsw":   (InstructionType.MEMORY, "load", None),
    "str":     (InstructionType.MEMORY, "store", None),
    "strb":    (InstructionType.MEMORY, "store", None),
    "ldp":     (InstructionType.MEMORY, "load", None),
    "stp":     (InstructionType.MEMORY, "store", None),
    "adrp":    (InstructionType.MEMORY, "load_address", None),

    "cmp":     (InstructionType.BRANCHING, "compare", None),
    "cmn":     (InstructionType.BRANCHING, "compare_neg", None),
    "b":       (InstructionType.BRANCHING, "jump", None),
    "bl":      (InstructionType.BRANCHING, "call", None),
    "ret":     (InstructionType.BRANCHING, "return", None),
    "beq":     (InstructionType.BRANCHING, "branch_eq", None),
    "bne":     (InstructionType.BRANCHING, "branch_ne", None),
    "bgt":     (InstructionType.BRANCHING, "branch_gt", None),
}


def get_mappings_for_lang(lang: str):
    if lang == "riscv":
        return riscv_mapping
    elif lang == "arm64":
        return arm64_mapping
    else:
        raise NotImplementedError(
            f"Mappings for lang {lang} are not supported yet"
        )
