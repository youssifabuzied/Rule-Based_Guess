	.section .text
	.globl _func0
	.align 2

_func0:
	.cfi_startproc

	stp	x24, x23, [sp, #-64]!           // 16-byte Folded Spill
	.cfi_def_cfa_offset 64
	.cfi_offset 24, -64
	.cfi_offset 23, -56

	stp	x22, x21, [sp, #16]             // 16-byte Folded Spill
	.cfi_offset 22, -48
	.cfi_offset 21, -40

	stp	x20, x19, [sp, #32]             // 16-byte Folded Spill
	.cfi_offset 20, -32
	.cfi_offset 19, -24

	stp	x29, x30, [sp, #48]             // 16-byte Folded Spill
	.cfi_offset 29, -16
	.cfi_offset 30, -8

	add	x29, sp, #48
	.cfi_def_cfa_register 29

	mov	x19, x1
	mov	x20, x0
	mov	w8, #0
	mov	w22, #0
	mov	w21, #0
	mov	x0, #0

	b	LBB0_3

LBB0_1:
	cbz	w9, LBB0_8

LBB0_2:
	add	x20, x20, #1

LBB0_3:
	ldrb	w9, [x20]
	cmp	w9, #40
	b.eq	LBB0_7

	cmp	w9, #41
	b.ne	LBB0_1

	subs	w8, w8, #1
	b.ne	LBB0_2

	add	w23, w21, #1
	sbfiz	x1, x23, #2, #32
	bl	_realloc
	mov	w8, #0
	str	w22, [x0, w21, sxtw #2]
	mov	x21, x23
	mov	w22, #0
	b	LBB0_2

LBB0_7:
	cmp	w8, w22
	csinc	w22, w22, w8, lt
	add	w8, w8, #1
	add	x20, x20, #1
	b	LBB0_3

LBB0_8:
	str	w21, [x19]

	ldp	x29, x30, [sp, #48]
	ldp	x20, x19, [sp, #32]
	ldp	x22, x21, [sp, #16]
	ldp	x24, x23, [sp], #64

	ret
	.cfi_endproc
