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
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	sbfiz	x0, x19, #2, #32
	bl	_malloc
	cmp	w19, #1
	b.lt	LBB0_3
; %bb.1:
	mov	w8, #0
	mov	w9, #1
	mov	w10, w19
	mov	w11, #1
LBB0_2:                                 ; =>This Inner Loop Header: Depth=1
	sub	w12, w9, #1
	mul	w13, w11, w9
	tst	w9, #0x1
	csinc	w8, w13, w8, ne
	str	w8, [x0], #4
	add	w9, w9, #1
	add	w8, w12, w8
	mul	w11, w13, w12
	subs	x10, x10, #1
	b.ne	LBB0_2
LBB0_3:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
