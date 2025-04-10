from src.sketch.uni_parser import parse_assembly
from src.sketch.uni_parser.ast import *
from src.sketch.instruction_mapping import get_mappings_for_lang

from difflib import SequenceMatcher


def string_similarity(a: str, b: str) -> float:
    return SequenceMatcher(None, a, b).ratio()


def compare_operand_values(op1: Operand, op2: Operand) -> float:
    if isinstance(op1, Register):
        return float(op1.name == op2.name)

    if isinstance(op1, Immediate):
        return 1.0 if op1.value == op2.value else 1.0 / (1 + abs(op1.value - op2.value))

    if isinstance(op1, Symbol) or isinstance(op1, DotSymbol):
        return string_similarity(op1.name, op2.name)

    if isinstance(op1, RelocationExpr) or isinstance(op1, ModifiedSymbol):
        mod_sim = string_similarity(op1.modifier, op2.modifier)
        sym_sim = string_similarity(op1.symbol, op2.symbol)
        return 0.5 * mod_sim + 0.5 * sym_sim

    if isinstance(op1, Expression):
        return 0.5 * string_similarity(op1.base, op2.base) + 0.5 * string_similarity(op1.minus, op2.minus)

    if isinstance(op1, MemoryOperand):
        base_sim = string_similarity(op1.base, op2.base)
        offset_sim = 1.0 if op1.offset == op2.offset else 0.5
        preidx_sim = float(op1.preindexed == op2.preindexed)
        return (base_sim + offset_sim + preidx_sim) / 3.0

    return 0.0


def compare_operands(ops1: List[Operand], ops2: List[Operand]) -> float:
    if len(ops1) != len(ops2):
        return 0.0

    scores = []
    for o1, o2 in zip(ops1, ops2):
        if type(o1) != type(o2):
            scores.append(0.0)
        else:
            scores.append(compare_operand_values(o1, o2))

    return sum(scores) / len(scores) if scores else 1.0


def compare_line_instructions(pred_line: str, src_line: str, pred_lang: str, src_lang: str) -> float:
    pred_instrs = parse_assembly(pred_line)
    src_instrs = parse_assembly(src_line)

    # Sanity check
    if not pred_instrs or not src_instrs:
        return 0.0

    pred = pred_instrs[0]
    src = src_instrs[0]

    # Type mismatch (e.g., Label vs Instruction)
    if type(pred) != type(src):
        return 0.0

    # Label similarity
    if isinstance(pred, Label):
        return string_similarity(pred.name, src.name)

    # Instruction similarity with semantic mapping
    if isinstance(pred, Instruction):
        pred_map = get_mappings_for_lang(pred_lang)
        src_map = get_mappings_for_lang(src_lang)

        pred_entry = pred_map.get(pred.name)
        src_entry = src_map.get(src.name)

        if pred_entry and src_entry:
            # Compare by semantic alias (e.g., both "add")
            if pred_entry[1] == src_entry[1]:
                name_sim = 1.0  # perfect match semantically
            else:
                name_sim = 0.0  # different meaning entirely
        else:
            # Fallback to raw name similarity
            name_sim = string_similarity(pred.name, src.name)

        operand_sim = compare_operands(pred.operands, src.operands)
        return 0.5 * name_sim + 0.5 * operand_sim

    # Directive similarity — same logic as instructions
    if isinstance(pred, Directive):
        pred_map = get_mappings_for_lang(pred_lang)
        src_map = get_mappings_for_lang(src_lang)

        pred_entry = pred_map.get(pred.name)
        src_entry = src_map.get(src.name)

        if pred_entry and src_entry:
            if pred_entry[1] == src_entry[1]:
                name_sim = 1.0
            else:
                name_sim = 0.0
        else:
            name_sim = string_similarity(pred.name, src.name)

        operand_sim = compare_operands(pred.operands, src.operands)
        return 0.5 * name_sim + 0.5 * operand_sim

    return 0.0
