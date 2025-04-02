	.arch armv8-a
	.file	"problem12.c"
	.text
	.section	.rodata
	.align	3
.LC0:
	.string	"%lu\n"
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
	mov	x0, 1	
	str	x0, [sp, 16]	
	mov	x0, 1	
	str	x0, [sp, 24]	
	b	.L2		
.L3:
	ldr	x0, [sp, 16]	
	add	x0, x0, 1	
	str	x0, [sp, 16]	
	ldr	x0, [sp, 16]	
	ldr	x1, [sp, 24]	
	add	x0, x1, x0	
	str	x0, [sp, 24]	
.L2:
	ldr	x0, [sp, 24]	
	bl	divisor_count		
	cmp	w0, 499	
	bls	.L3		
	ldr	x1, [sp, 24]	
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
	.type	divisor_count, %function
divisor_count:
.LFB1:
	.cfi_startproc
	sub	sp, sp, #32	
	.cfi_def_cfa_offset 32
	str	x0, [sp, 8]	
	mov	w0, 1	
	str	w0, [sp, 16]	
	mov	x0, 2	
	str	x0, [sp, 24]	
	b	.L6		
.L9:
	str	wzr, [sp, 20]	
	b	.L7		
.L8:
	ldr	w0, [sp, 20]	
	add	w0, w0, 1	
	str	w0, [sp, 20]	
	ldr	x1, [sp, 8]	
	ldr	x0, [sp, 24]	
	udiv	x0, x1, x0	
	str	x0, [sp, 8]	
.L7:
	ldr	x0, [sp, 8]	
	ldr	x1, [sp, 24]	
	udiv	x2, x0, x1	
	ldr	x1, [sp, 24]	
	mul	x1, x2, x1	
	sub	x0, x0, x1	
	cmp	x0, 0	
	beq	.L8		
	ldr	w0, [sp, 20]	
	add	w0, w0, 1	
	ldr	w1, [sp, 16]	
	mul	w0, w1, w0	
	str	w0, [sp, 16]	
	ldr	x0, [sp, 24]	
	add	x0, x0, 1	
	str	x0, [sp, 24]	
.L6:
	ldr	x1, [sp, 24]	
	ldr	x0, [sp, 8]	
	cmp	x1, x0	
	bls	.L9		
	ldr	w0, [sp, 16]	
	add	sp, sp, 32	
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE1:
	.size	divisor_count, .-divisor_count
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
