 
 
	.section	__TEXT,__text,regular,pure_instructions

	.build_version macos, 13, 0	sdk_version 13, 3

	.globl	_func0                          ; -- Begin function func0

	.p2align	2

_func0:                                 ; @func0

	.cfi_startproc

; %bb.0:

	stp	x26, x25, [sp, #-80]!           ; 16-byte Folded Spill

	.cfi_def_cfa_offset 80

	stp	x24, x23, [sp, #16]             ; 16-byte Folded Spill

	stp	x22, x21, [sp, #32]             ; 16-byte Folded Spill

	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill

	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill

	add	x29, sp, #64

	.cfi_def_cfa w29, 16

	.cfi_offset w30, -8

	.cfi_offset w29, -16

	.cfi_offset w19, -12

	.cfi_offset w20, -18

	.cfi_offset w21, -24

	.cfi_offset w22, -12

	.cfi_offset w23, -20

	.cfi_offset w24, -28

	.cfi_offset w25, -36

	.cfi_offset w26, -44

	mov	x19, x3

	cmp	w1, #1

	b.lt	LBB0_5

; %bb.1:

	mov	x20, x2

	mov	x22, x0

	mov	w24, #0

	mov	x21, #0

	mov	w23, w1

	b	LBB0_3

LBB0_2:                                 ;   in Loop: Header=BB0_3 Depth=1

	add	x22, x22, #8

	subs	x23, x23, #1

	b.eq	LBB0_6

LBB0_3:                                 ; =>This Inner Loop Header: Depth=1

	ldr	x0, [x22]

	mov	x1, x20

	bl	_strstr

	cbz	x0, LBB0_2

; %bb.4:                                ;   in Loop: Header=BB0_3 Depth=1

	add	w25, w24, #1

	sbfiz	x1, x25, #3, #32

	mov	x0, x21

	bl	_realloc

	mov	x21, x0

	ldr	x8, [x22]

	str	x8, [x0, w24, sxtw #3]

	mov	x24, x25

	b	LBB0_2

LBB0_5:

	mov	x21, #0

	mov	w24, #0

LBB0_6:

	str	w24, [x19]

	mov	x0, x21

	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload

	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload

	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload

	ldp	x24, x23, [sp, #16]             ; 16-byte Folded Reload

	ldp	x26, x25, [sp], #80             ; 16-byte Folded Reload

	ret

	.cfi_endproc

                                        ; -- End function

.subsections_via_symbols

 
