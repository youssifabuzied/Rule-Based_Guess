	.arch armv8-a
	.file	"problem46.c"
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
.LFB6:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!	
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp	
	mov	w0, 10000	
	bl	prime_sieve		
	str	x0, [sp, 32]	
	mov	x0, 40000	
	bl	malloc		
	str	x0, [sp, 40]	
	str	wzr, [sp, 24]	
	str	wzr, [sp, 20]	
	b	.L2		
.L4:
	ldr	w0, [sp, 20]	
	ldr	x1, [sp, 32]	
	add	x0, x1, x0	
	ldrb	w0, [x0]	
	cmp	w0, 0	
	bne	.L3		
	ldr	w0, [sp, 24]	
	add	w1, w0, 1	
	str	w1, [sp, 24]	
	uxtw	x0, w0	
	lsl	x0, x0, 2	
	ldr	x1, [sp, 40]	
	add	x0, x1, x0	
	ldr	w1, [sp, 20]	
	str	w1, [x0]	
.L3:
	ldr	w0, [sp, 20]	
	add	w0, w0, 1	
	str	w0, [sp, 20]	
.L2:
	ldr	w1, [sp, 20]	
	mov	w0, 9999	
	cmp	w1, w0	
	bls	.L4		
	ldr	w0, [sp, 24]	
	lsl	x0, x0, 2	
	ldr	x1, [sp, 40]	
	add	x0, x1, x0	
	str	wzr, [x0]	
	mov	w0, 3	
	str	w0, [sp, 20]	
	b	.L5		
.L13:
	ldr	w0, [sp, 20]	
	ldr	x1, [sp, 32]	
	add	x0, x1, x0	
	ldrb	w0, [x0]	
	cmp	w0, 0	
	beq	.L15		
	str	wzr, [sp, 24]	
	b	.L8		
.L12:
	ldr	w0, [sp, 24]	
	lsl	x0, x0, 2	
	ldr	x1, [sp, 40]	
	add	x0, x1, x0	
	ldr	w0, [x0]	
	ldr	w1, [sp, 20]	
	cmp	w1, w0	
	bcs	.L9		
	ldr	w1, [sp, 20]	
	adrp	x0, .LC0	
	add	x0, x0, :lo12:.LC0	
	bl	printf		
	b	.L10		
.L9:
	ldr	w0, [sp, 24]	
	lsl	x0, x0, 2	
	ldr	x1, [sp, 40]	
	add	x0, x1, x0	
	ldr	w0, [x0]	
	ldr	w1, [sp, 20]	
	sub	w0, w1, w0	
	lsr	w0, w0, 1	
	str	w0, [sp, 28]	
	ldr	w0, [sp, 28]	
	bl	is_square		
	cmp	w0, 0	
	bne	.L16		
	ldr	w0, [sp, 24]	
	add	w0, w0, 1	
	str	w0, [sp, 24]	
.L8:
	ldr	w0, [sp, 24]	
	lsl	x0, x0, 2	
	ldr	x1, [sp, 40]	
	add	x0, x1, x0	
	ldr	w0, [x0]	
	cmp	w0, 0	
	bne	.L12		
	b	.L7		
.L15:
	nop	
	b	.L7		
.L16:
	nop	
.L7:
	ldr	w0, [sp, 20]	
	add	w0, w0, 2	
	str	w0, [sp, 20]	
.L5:
	ldr	w1, [sp, 20]	
	mov	w0, 9999	
	cmp	w1, w0	
	bls	.L13		
	nop	
.L10:
	ldr	x0, [sp, 32]	
	bl	free		
	ldr	x0, [sp, 40]	
	bl	free		
	mov	w0, 0	
	ldp	x29, x30, [sp], 48	
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.align	2
	.type	prime_sieve, %function
prime_sieve:
.LFB7:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!	
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp	
	str	w0, [sp, 28]	
	ldr	w0, [sp, 28]	
	mov	x1, 1	
	bl	calloc		
	str	x0, [sp, 40]	
	ldr	x0, [sp, 40]	
	add	x0, x0, 1	
	mov	w1, 1	
	strb	w1, [x0]	
	ldrb	w1, [x0]	
	ldr	x0, [sp, 40]	
	strb	w1, [x0]	
	mov	w0, 2	
	str	w0, [sp, 32]	
	b	.L18		
.L22:
	ldr	w0, [sp, 32]	
	ldr	x1, [sp, 40]	
	add	x0, x1, x0	
	ldrb	w0, [x0]	
	cmp	w0, 0	
	bne	.L19		
	ldr	w0, [sp, 32]	
	lsl	w0, w0, 1	
	str	w0, [sp, 36]	
	b	.L20		
.L21:
	ldr	w0, [sp, 36]	
	ldr	x1, [sp, 40]	
	add	x0, x1, x0	
	mov	w1, 1	
	strb	w1, [x0]	
	ldr	w1, [sp, 36]	
	ldr	w0, [sp, 32]	
	add	w0, w1, w0	
	str	w0, [sp, 36]	
.L20:
	ldr	w1, [sp, 36]	
	ldr	w0, [sp, 28]	
	cmp	w1, w0	
	bcc	.L21		
.L19:
	ldr	w0, [sp, 32]	
	add	w0, w0, 1	
	str	w0, [sp, 32]	
.L18:
	ldr	w1, [sp, 32]	
	ldr	w0, [sp, 28]	
	cmp	w1, w0	
	bcc	.L22		
	ldr	x0, [sp, 40]	
	ldp	x29, x30, [sp], 48	
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE7:
	.size	prime_sieve, .-prime_sieve
	.align	2
	.type	is_square, %function
is_square:
.LFB8:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!	
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp	
	str	w0, [sp, 28]	
	ldr	w0, [sp, 28]	
	ucvtf	d0, w0	
	bl	sqrt		
	fcvtzu	w0, d0	
	str	w0, [sp, 44]	
	ldr	w0, [sp, 44]	
	mul	w0, w0, w0	
	ldr	w1, [sp, 28]	
	cmp	w1, w0	
	cset	w0, eq	
	and	w0, w0, 255	
	ldp	x29, x30, [sp], 48	
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE8:
	.size	is_square, .-is_square
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
