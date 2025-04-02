	.arch armv8-a
	.file	"problem47.c"
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
	stp	x29, x30, [sp, -32]!	
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp	
	str	wzr, [sp, 28]	
	mov	w0, 2	
	str	w0, [sp, 24]	
	b	.L2		
.L7:
	str	wzr, [sp, 28]	
	b	.L3		
.L5:
	ldr	w0, [sp, 28]	
	add	w0, w0, 1	
	str	w0, [sp, 28]	
.L3:
	ldr	w0, [sp, 28]	
	cmp	w0, 3	
	bhi	.L4		
	ldr	w1, [sp, 24]	
	ldr	w0, [sp, 28]	
	add	w0, w1, w0	
	bl	distinct_factor_count		
	cmp	w0, 4	
	beq	.L5		
.L4:
	ldr	w0, [sp, 24]	
	add	w0, w0, 1	
	str	w0, [sp, 24]	
.L2:
	ldr	w1, [sp, 24]	
	mov	w0, 16959	
	movk	w0, 0xf, lsl 16	
	cmp	w1, w0	
	bhi	.L6		
	ldr	w0, [sp, 28]	
	cmp	w0, 3	
	bls	.L7		
.L6:
	ldr	w0, [sp, 24]	
	sub	w0, w0, #1	
	mov	w1, w0	
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
	.type	distinct_factor_count, %function
distinct_factor_count:
.LFB1:
	.cfi_startproc
	sub	sp, sp, #32	
	.cfi_def_cfa_offset 32
	str	w0, [sp, 12]	
	str	wzr, [sp, 24]	
	mov	w0, 2	
	str	w0, [sp, 28]	
	b	.L10		
.L14:
	ldr	w0, [sp, 12]	
	ldr	w1, [sp, 28]	
	udiv	w2, w0, w1	
	ldr	w1, [sp, 28]	
	mul	w1, w2, w1	
	sub	w0, w0, w1	
	cmp	w0, 0	
	bne	.L11		
	ldr	w0, [sp, 24]	
	add	w0, w0, 1	
	str	w0, [sp, 24]	
	ldr	w1, [sp, 12]	
	ldr	w0, [sp, 28]	
	udiv	w0, w1, w0	
	str	w0, [sp, 12]	
	b	.L12		
.L13:
	ldr	w1, [sp, 12]	
	ldr	w0, [sp, 28]	
	udiv	w0, w1, w0	
	str	w0, [sp, 12]	
.L12:
	ldr	w0, [sp, 12]	
	ldr	w1, [sp, 28]	
	udiv	w2, w0, w1	
	ldr	w1, [sp, 28]	
	mul	w1, w2, w1	
	sub	w0, w0, w1	
	cmp	w0, 0	
	beq	.L13		
.L11:
	ldr	w0, [sp, 28]	
	add	w0, w0, 1	
	str	w0, [sp, 28]	
.L10:
	ldr	w1, [sp, 28]	
	ldr	w0, [sp, 12]	
	cmp	w1, w0	
	bls	.L14		
	ldr	w0, [sp, 24]	
	add	sp, sp, 32	
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE1:
	.size	distinct_factor_count, .-distinct_factor_count
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
