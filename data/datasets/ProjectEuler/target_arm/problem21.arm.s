	.arch armv8-a
	.file	"problem21.c"
	.text
	.section	.rodata
	.align	3
.LC0:
	.string	"%d\n"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB0:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!	
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp	
	str	wzr, [sp, 24]	
	mov	w0, 2	
	str	w0, [sp, 20]	
	b	.L2		
.L4:
	ldr	w0, [sp, 20]	
	bl	divisors_sum		
	str	w0, [sp, 28]	
	ldr	w1, [sp, 20]	
	ldr	w0, [sp, 28]	
	cmp	w1, w0	
	bge	.L3		
	ldr	w0, [sp, 28]	
	bl	divisors_sum		
	mov	w1, w0	
	ldr	w0, [sp, 20]	
	cmp	w0, w1	
	bne	.L3		
	ldr	w1, [sp, 20]	
	ldr	w0, [sp, 28]	
	add	w0, w1, w0	
	ldr	w1, [sp, 24]	
	add	w0, w1, w0	
	str	w0, [sp, 24]	
.L3:
	ldr	w0, [sp, 20]	
	add	w0, w0, 1	
	str	w0, [sp, 20]	
.L2:
	ldr	w1, [sp, 20]	
	mov	w0, 9999	
	cmp	w1, w0	
	ble	.L4		
	ldr	w1, [sp, 24]	
	adrp	x0, .LC0	
	add	x0, x0, :lo12:.LC0	
	bl	printf		
	mov	w0, 0	
	ldp	x29, x30, [sp], 32	
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.align	2
	.type	divisors_sum, %function
divisors_sum:
.LFB1:
	.cfi_startproc
	sub	sp, sp, #32	
	.cfi_def_cfa_offset 32
	str	w0, [sp, 12]	
	mov	w0, 1	
	str	w0, [sp, 16]	
	ldr	w0, [sp, 12]	
	str	w0, [sp, 24]	
	mov	w0, 2	
	str	w0, [sp, 20]	
	b	.L7		
.L10:
	mov	w0, 1	
	str	w0, [sp, 28]	
	b	.L8		
.L9:
	ldr	w1, [sp, 28]	
	ldr	w0, [sp, 20]	
	mul	w0, w1, w0	
	str	w0, [sp, 28]	
	ldr	w1, [sp, 24]	
	ldr	w0, [sp, 20]	
	sdiv	w0, w1, w0	
	str	w0, [sp, 24]	
.L8:
	ldr	w0, [sp, 24]	
	ldr	w1, [sp, 20]	
	sdiv	w2, w0, w1	
	ldr	w1, [sp, 20]	
	mul	w1, w2, w1	
	sub	w0, w0, w1	
	cmp	w0, 0	
	beq	.L9		
	ldr	w1, [sp, 28]	
	ldr	w0, [sp, 20]	
	mul	w0, w1, w0	
	sub	w1, w0, #1	
	ldr	w0, [sp, 20]	
	sub	w0, w0, #1	
	sdiv	w0, w1, w0	
	ldr	w1, [sp, 16]	
	mul	w0, w1, w0	
	str	w0, [sp, 16]	
	ldr	w0, [sp, 20]	
	add	w0, w0, 1	
	str	w0, [sp, 20]	
.L7:
	ldr	w1, [sp, 20]	
	ldr	w0, [sp, 24]	
	cmp	w1, w0	
	ble	.L10		
	ldr	w1, [sp, 16]	
	ldr	w0, [sp, 12]	
	sub	w0, w1, w0	
	add	sp, sp, 32	
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE1:
	.size	divisors_sum, .-divisors_sum
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
