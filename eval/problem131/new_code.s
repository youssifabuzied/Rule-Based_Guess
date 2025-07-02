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
	add	w20, w0, #1
	mov	x8, x20
	sbfiz	x0, x8, #2, #32
	bl	_malloc
	mov	w8, #1
	str	w8, [x0]
	cbz	w19, LBB0_2
;; %bb.1:
	mov	w8, #3
	str	w8, [x0, #4]
	cmp	w19, #2
	b.ge	LBB0_3
LBB0_2:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
LBB0_3:
	mov	x9, #0
	sub	x8, x20, #1
	add	x10, x0, #12
	mov	w11, #3
	b	LBB0_6
LBB0_4:                                 ;   in Loop: Header=BB0_6 Depth=1
	ldr	w12, [x0, x9, lsl #2]
	add	x13, x9, #1
	add	w11, w11, w13, lsr #1
	add	w11, w11, w12
	add	w11, w11, #1
LBB0_5:                                 ;   in Loop: Header=BB0_6 Depth=1
	str	w11, [x10, x9, lsl #2]
	mov	x9, x13
	cmp	x13, x8
	b.eq	LBB0_2
LBB0_6:                                 ; =>This Inner Loop Header: Depth=1
	tbnz	w9, #0, LBB0_4
; %bb.7:                                ;   in Loop: Header=BB0_6 Depth=1
	lsr	w11, w9, #1
	add	w11, w11, #1
	add	x13, x9, #1
	b	LBB0_5
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
