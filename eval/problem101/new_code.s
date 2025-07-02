```armasm
	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -14
	.cfi_offset w20, -24
	mov	x19, x0
	sbfiz	x0, x19, #2, #32
	bl	_malloc
	str	w19, [x0]
	cmp	w19, #2
	b.lt	LBB0_3
; %bb.1:
	mov	w8, w19
	ldr	w9, [x0]
	sub	x8, x8, #1
	add	x10, x0, #4
LBB0_2:                                 ; =>This Inner Loop Header: Depth=1
	add	w11, w9, #2
	str	w11, [x10], #8
	add	w9, w9, #4
	subs	x8, x8, #1
	b.ne	LBB0_2
LBB0_3:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
