	.arch armv8-a
	.file	"problem39.c"
	.text
	.section	.rodata
	.align	3
.LC0:
	.string	"%u\n"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB0:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!	
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp	
	str	wzr, [sp, 36]	
	str	wzr, [sp, 40]	
	mov	w0, 1	
	str	w0, [sp, 28]	
	b	.L2		
.L9:
	str	wzr, [sp, 32]	
	mov	w0, 1	
	str	w0, [sp, 20]	
	b	.L3		
.L7:
	ldr	w0, [sp, 20]	
	str	w0, [sp, 24]	
	b	.L4		
.L6:
	ldr	w1, [sp, 28]	
	ldr	w0, [sp, 20]	
	sub	w1, w1, w0	
	ldr	w0, [sp, 24]	
	sub	w0, w1, w0	
	str	w0, [sp, 44]	
	ldr	w0, [sp, 20]	
	mul	w1, w0, w0	
	ldr	w0, [sp, 24]	
	mul	w0, w0, w0	
	add	w1, w1, w0	
	ldr	w0, [sp, 44]	
	mul	w0, w0, w0	
	cmp	w1, w0	
	bne	.L5		
	ldr	w0, [sp, 32]	
	add	w0, w0, 1	
	str	w0, [sp, 32]	
.L5:
	ldr	w0, [sp, 24]	
	add	w0, w0, 1	
	str	w0, [sp, 24]	
.L4:
	ldr	w0, [sp, 28]	
	lsr	w0, w0, 1	
	ldr	w1, [sp, 24]	
	cmp	w1, w0	
	bcc	.L6		
	ldr	w0, [sp, 20]	
	add	w0, w0, 1	
	str	w0, [sp, 20]	
.L3:
	ldr	w0, [sp, 28]	
	lsr	w0, w0, 1	
	ldr	w1, [sp, 20]	
	cmp	w1, w0	
	bcc	.L7		
	ldr	w1, [sp, 32]	
	ldr	w0, [sp, 36]	
	cmp	w1, w0	
	bls	.L8		
	ldr	w0, [sp, 32]	
	str	w0, [sp, 36]	
	ldr	w0, [sp, 28]	
	str	w0, [sp, 40]	
.L8:
	ldr	w0, [sp, 28]	
	add	w0, w0, 1	
	str	w0, [sp, 28]	
.L2:
	ldr	w0, [sp, 28]	
	cmp	w0, 1000	
	bls	.L9		
	ldr	w1, [sp, 40]	
	adrp	x0, .LC0	
	add	x0, x0, :lo12:.LC0	
	bl	printf		
	mov	w0, 0	
	ldp	x29, x30, [sp], 48	
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
