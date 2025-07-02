	.section .text
	.globl _func0
	.align 2

_func0:
	.cfi_startproc

	// Prologue: Save callee-saved registers and setup frame pointer
	stp	x26, x25, [sp, #-80]!          // Push x26,x25, decrement sp by 80
	.cfi_def_cfa_offset 80
	.cfi_offset 26, -80
	.cfi_offset 25, -72

	stp	x24, x23, [sp, #16]            // Store x24,x23 at sp+16
	.cfi_offset 24, -64
	.cfi_offset 23, -56

	stp	x22, x21, [sp, #32]            // Store x22,x21 at sp+32
	.cfi_offset 22, -48
	.cfi_offset 21, -40

	stp	x20, x19, [sp, #48]            // Store x20,x19 at sp+48
	.cfi_offset 20, -32
	.cfi_offset 19, -24

	stp	x29, x30, [sp, #64]            // Store frame pointer and LR at sp+64
	.cfi_offset 29, -16
	.cfi_offset 30, -8

	add	x29, sp, #64                  // Set frame pointer to sp + 64
	.cfi_def_cfa_register 29

	mov	x19, x3
	cmp	w1, #1
	b.lt	LBB0_5

	mov	x20, x2
	mov	x22, x0
	mov	w24, #0
	mov	x21, #0
	mov	w23, w1
	b	LBB0_3

LBB0_2:
	add	x22, x22, #8
	subs	x23, x23, #1
	b.eq	LBB0_6

LBB0_3:
	ldr	x0, [x22]
	mov	x1, x20
	bl	_strstr
	cbz	x0, LBB0_2

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

	ldp	x29, x30, [sp, #64]
	ldp	x20, x19, [sp, #48]
	ldp	x22, x21, [sp, #32]
	ldp	x24, x23, [sp, #16]
	ldp	x26, x25, [sp], #80

	ret
	.cfi_endproc
