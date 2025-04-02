	.arch armv8-a
	.file	"problem35.c"
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
	str	wzr, [sp, 24]	
	mov	w0, 2	
	str	w0, [sp, 20]	
	b	.L2		
.L9:
	ldr	w0, [sp, 20]	
	bl	is_prime		
	cmp	w0, 0	
	beq	.L11		
	ldr	w0, [sp, 20]	
	ucvtf	d0, w0	
	bl	log10		
	fcvtzu	w0, d0	
	str	w0, [sp, 36]	
	ldr	w0, [sp, 20]	
	str	w0, [sp, 28]	
	str	wzr, [sp, 32]	
	b	.L5		
.L8:
	ldr	w0, [sp, 36]	
	ucvtf	d0, w0	
	fmov	d1, d0	
	fmov	d0, 1.0e+1	
	bl	pow		
	fcvtzu	w0, d0	
	str	w0, [sp, 40]	
	ldr	w0, [sp, 28]	
	ldr	w1, [sp, 40]	
	udiv	w2, w0, w1	
	ldr	w1, [sp, 40]	
	mul	w1, w2, w1	
	sub	w0, w0, w1	
	str	w0, [sp, 44]	
	ldr	w1, [sp, 28]	
	ldr	w0, [sp, 40]	
	udiv	w0, w1, w0	
	str	w0, [sp, 28]	
	ldr	w1, [sp, 44]	
	mov	w0, w1	
	lsl	w0, w0, 2	
	add	w0, w0, w1	
	lsl	w0, w0, 1	
	mov	w1, w0	
	ldr	w0, [sp, 28]	
	add	w0, w0, w1	
	str	w0, [sp, 28]	
	ldr	w0, [sp, 28]	
	bl	is_prime		
	cmp	w0, 0	
	beq	.L12		
	ldr	w0, [sp, 32]	
	add	w0, w0, 1	
	str	w0, [sp, 32]	
.L5:
	ldr	w1, [sp, 32]	
	ldr	w0, [sp, 36]	
	cmp	w1, w0	
	bcc	.L8		
	ldr	w0, [sp, 24]	
	add	w0, w0, 1	
	str	w0, [sp, 24]	
	b	.L4		
.L7:
.L11:
	nop	
	b	.L4		
.L12:
	nop	
.L4:
	ldr	w0, [sp, 20]	
	add	w0, w0, 1	
	str	w0, [sp, 20]	
.L2:
	ldr	w1, [sp, 20]	
	mov	w0, 16959	
	movk	w0, 0xf, lsl 16	
	cmp	w1, w0	
	bls	.L9		
	ldr	w1, [sp, 24]	
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
	.align	2
	.type	is_prime, %function
is_prime:
.LFB1:
	.cfi_startproc
	sub	sp, sp, #32	
	.cfi_def_cfa_offset 32
	str	w0, [sp, 12]	
	ldr	w0, [sp, 12]	
	cmp	w0, 1	
	bhi	.L14		
	mov	w0, 0	
	b	.L15		
.L14:
	ldr	w0, [sp, 12]	
	cmp	w0, 2	
	bne	.L16		
	mov	w0, 1	
	b	.L15		
.L16:
	mov	w0, 2	
	str	w0, [sp, 28]	
	b	.L17		
.L19:
	ldr	w0, [sp, 12]	
	ldr	w1, [sp, 28]	
	udiv	w2, w0, w1	
	ldr	w1, [sp, 28]	
	mul	w1, w2, w1	
	sub	w0, w0, w1	
	cmp	w0, 0	
	bne	.L18		
	mov	w0, 0	
	b	.L15		
.L18:
	ldr	w0, [sp, 28]	
	add	w0, w0, 1	
	str	w0, [sp, 28]	
.L17:
	ldr	w0, [sp, 28]	
	mul	w0, w0, w0	
	ldr	w1, [sp, 12]	
	cmp	w1, w0	
	bcs	.L19		
	mov	w0, 1	
.L15:
	add	sp, sp, 32	
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE1:
	.size	is_prime, .-is_prime
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
