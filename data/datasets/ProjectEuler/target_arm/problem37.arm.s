	.arch armv8-a
	.file	"problem37.c"
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
	str	wzr, [sp, 32]	
	str	wzr, [sp, 36]	
	mov	w0, 10	
	str	w0, [sp, 28]	
	b	.L2		
.L10:
	ldr	w0, [sp, 28]	
	str	w0, [sp, 40]	
	b	.L3		
.L6:
	ldr	w0, [sp, 40]	
	bl	is_prime		
	cmp	w0, 0	
	beq	.L12		
	ldr	w1, [sp, 40]	
	mov	w0, 52429	
	movk	w0, 0xcccc, lsl 16	
	umull	x0, w1, w0	
	lsr	x0, x0, 32	
	lsr	w0, w0, 3	
	str	w0, [sp, 40]	
.L3:
	ldr	w0, [sp, 40]	
	cmp	w0, 0	
	bne	.L6		
	ldr	w0, [sp, 28]	
	str	w0, [sp, 40]	
	ldr	w0, [sp, 40]	
	ucvtf	d0, w0	
	bl	log10		
	fcvtzu	w0, d0	
	str	w0, [sp, 44]	
	ldr	w0, [sp, 44]	
	ucvtf	d0, w0	
	fmov	d1, d0	
	fmov	d0, 1.0e+1	
	bl	pow		
	fcvtzu	w0, d0	
	str	w0, [sp, 44]	
	b	.L7		
.L9:
	ldr	w0, [sp, 40]	
	ldr	w1, [sp, 44]	
	udiv	w2, w0, w1	
	ldr	w1, [sp, 44]	
	mul	w1, w2, w1	
	sub	w0, w0, w1	
	bl	is_prime		
	cmp	w0, 0	
	beq	.L13		
	ldr	w1, [sp, 44]	
	mov	w0, 52429	
	movk	w0, 0xcccc, lsl 16	
	umull	x0, w1, w0	
	lsr	x0, x0, 32	
	lsr	w0, w0, 3	
	str	w0, [sp, 44]	
.L7:
	ldr	w0, [sp, 44]	
	cmp	w0, 1	
	bne	.L9		
	ldr	w1, [sp, 36]	
	ldr	w0, [sp, 28]	
	add	w0, w1, w0	
	str	w0, [sp, 36]	
	ldr	w0, [sp, 32]	
	add	w0, w0, 1	
	str	w0, [sp, 32]	
	b	.L5		
.L12:
	nop	
	b	.L5		
.L13:
	nop	
.L5:
	ldr	w0, [sp, 28]	
	add	w0, w0, 1	
	str	w0, [sp, 28]	
.L2:
	ldr	w0, [sp, 32]	
	cmp	w0, 10	
	bls	.L10		
	ldr	w1, [sp, 36]	
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
	bhi	.L15		
	mov	w0, 0	
	b	.L16		
.L15:
	ldr	w0, [sp, 12]	
	cmp	w0, 2	
	bne	.L17		
	mov	w0, 1	
	b	.L16		
.L17:
	mov	w0, 2	
	str	w0, [sp, 28]	
	b	.L18		
.L20:
	ldr	w0, [sp, 12]	
	ldr	w1, [sp, 28]	
	udiv	w2, w0, w1	
	ldr	w1, [sp, 28]	
	mul	w1, w2, w1	
	sub	w0, w0, w1	
	cmp	w0, 0	
	bne	.L19		
	mov	w0, 0	
	b	.L16		
.L19:
	ldr	w0, [sp, 28]	
	add	w0, w0, 1	
	str	w0, [sp, 28]	
.L18:
	ldr	w0, [sp, 28]	
	mul	w0, w0, w0	
	ldr	w1, [sp, 12]	
	cmp	w1, w0	
	bcs	.L20		
	mov	w0, 1	
.L16:
	add	sp, sp, 32	
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE1:
	.size	is_prime, .-is_prime
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
