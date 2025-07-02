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
	.cfi_offset w19, -12
	.cfi_offset w20, -20
	mov	x19, x0
	bl	_strlen
	cbz	x0, LBB0_5
; %bb.1:
	mov	w8, #0
	ldrb	w9, [x19]
	cmp	w9, #91
	cset	w10, eq
	cmp	w9, #93
	cset	w9, eq
	sub	w9, w10, w9
	cmp	w9, #0
	csel	w9, w9, wzr, gt
	mov	w10, #1
	mov	x11, x9
LBB0_2:                                 ; =>This Inner Loop Header: Depth=1
	mov	x12, x10
	cmp	x0, x10
	b.eq	LBB0_4
; %bb.3:                                ;   in Loop: Header=BB0_2 Depth=1
	ldrb	w11, [x19, x12]
	cmp	w11, #91
	cinc	w10, w11, eq
	cmp	w11, #93
	cset	w11, eq
	sub	w10, w10, w11
	cmp	w10, #0
	csel	w10, w10, wzr, gt
	cmp	w10, w9
	csel	w9, w10, w9, gt
	sub	w11, w9, #2
	add	x10, x12, #1
	cmp	w10, w11
	b.gt	LBB0_2
LBB0_4:
	cmp	x0, x12
	cset	w0, hi
LBB0_5:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
