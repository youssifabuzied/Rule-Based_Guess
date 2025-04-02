	.arch armv8-a
	.file	"problem33.c"
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
	stp	x29, x30, [sp, -64]!	
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp	
	adrp	x0, :got:__stack_chk_guard	
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]	
	ldr	x1, [x0]	
	str	x1, [sp, 56]	
	mov	x1, 0	
	mov	w0, 1	
	str	w0, [sp, 24]	
	mov	w0, 1	
	str	w0, [sp, 28]	
	mov	w0, 11	
	str	w0, [sp, 32]	
	b	.L2		
.L12:
	ldr	w2, [sp, 32]	
	mov	w0, 52429	
	movk	w0, 0xcccc, lsl 16	
	umull	x0, w2, w0	
	lsr	x0, x0, 32	
	lsr	w1, w0, 3	
	mov	w0, w1	
	lsl	w0, w0, 2	
	add	w0, w0, w1	
	lsl	w0, w0, 1	
	sub	w1, w2, w0	
	cmp	w1, 0	
	beq	.L15		
	mov	w0, 11	
	str	w0, [sp, 36]	
	b	.L5		
.L11:
	ldr	w2, [sp, 36]	
	mov	w0, 52429	
	movk	w0, 0xcccc, lsl 16	
	umull	x0, w2, w0	
	lsr	x0, x0, 32	
	lsr	w1, w0, 3	
	mov	w0, w1	
	lsl	w0, w0, 2	
	add	w0, w0, w1	
	lsl	w0, w0, 1	
	sub	w1, w2, w0	
	cmp	w1, 0	
	beq	.L16		
	ldr	w1, [sp, 36]	
	ldr	w0, [sp, 32]	
	bl	gcd		
	str	w0, [sp, 40]	
	ldr	w0, [sp, 40]	
	cmp	w0, 1	
	beq	.L17		
	ldr	w1, [sp, 36]	
	ldr	w0, [sp, 40]	
	udiv	w0, w1, w0	
	str	w0, [sp, 44]	
	ldr	w1, [sp, 32]	
	ldr	w0, [sp, 40]	
	udiv	w0, w1, w0	
	str	w0, [sp, 48]	
	add	x1, sp, 20	
	add	x0, sp, 16	
	mov	x3, x1	
	mov	x2, x0	
	ldr	w1, [sp, 32]	
	ldr	w0, [sp, 36]	
	bl	cancel		
	cmp	w0, 0	
	beq	.L10		
	ldr	w0, [sp, 16]	
	ldr	w1, [sp, 20]	
	bl	gcd		
	str	w0, [sp, 52]	
	ldr	w1, [sp, 16]	
	ldr	w0, [sp, 52]	
	udiv	w0, w1, w0	
	str	w0, [sp, 16]	
	ldr	w1, [sp, 20]	
	ldr	w0, [sp, 52]	
	udiv	w0, w1, w0	
	str	w0, [sp, 20]	
	ldr	w0, [sp, 16]	
	ldr	w1, [sp, 44]	
	cmp	w1, w0	
	bne	.L10		
	ldr	w0, [sp, 20]	
	ldr	w1, [sp, 48]	
	cmp	w1, w0	
	bne	.L10		
	ldr	w1, [sp, 24]	
	ldr	w0, [sp, 44]	
	mul	w0, w1, w0	
	str	w0, [sp, 24]	
	ldr	w1, [sp, 28]	
	ldr	w0, [sp, 48]	
	mul	w0, w1, w0	
	str	w0, [sp, 28]	
	b	.L10		
.L16:
	nop	
	b	.L10		
.L17:
	nop	
.L10:
	ldr	w0, [sp, 36]	
	add	w0, w0, 1	
	str	w0, [sp, 36]	
.L5:
	ldr	w1, [sp, 36]	
	ldr	w0, [sp, 32]	
	cmp	w1, w0	
	bcc	.L11		
	b	.L4		
.L15:
	nop	
.L4:
	ldr	w0, [sp, 32]	
	add	w0, w0, 1	
	str	w0, [sp, 32]	
.L2:
	ldr	w0, [sp, 32]	
	cmp	w0, 99	
	bls	.L12		
	ldr	w1, [sp, 28]	
	ldr	w0, [sp, 24]	
	bl	gcd		
	mov	w1, w0	
	ldr	w0, [sp, 28]	
	udiv	w0, w0, w1	
	mov	w1, w0	
	adrp	x0, .LC0	
	add	x0, x0, :lo12:.LC0	
	bl	printf		
	mov	w0, 0	
	mov	w1, w0	
	adrp	x0, :got:__stack_chk_guard	
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]	
	ldr	x3, [sp, 56]	
	ldr	x2, [x0]	
	subs	x3, x3, x2	
	mov	x2, 0	
	beq	.L14		
	bl	__stack_chk_fail		
.L14:
	mov	w0, w1	
	ldp	x29, x30, [sp], 64	
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.align	2
	.type	gcd, %function
gcd:
.LFB1:
	.cfi_startproc
	sub	sp, sp, #32	
	.cfi_def_cfa_offset 32
	str	w0, [sp, 12]	
	str	w1, [sp, 8]	
	b	.L19		
.L20:
	ldr	w0, [sp, 8]	
	str	w0, [sp, 12]	
	ldr	w0, [sp, 28]	
	str	w0, [sp, 8]	
.L19:
	ldr	w0, [sp, 12]	
	ldr	w1, [sp, 8]	
	udiv	w2, w0, w1	
	ldr	w1, [sp, 8]	
	mul	w1, w2, w1	
	sub	w0, w0, w1	
	str	w0, [sp, 28]	
	ldr	w0, [sp, 28]	
	cmp	w0, 0	
	bne	.L20		
	ldr	w0, [sp, 8]	
	add	sp, sp, 32	
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE1:
	.size	gcd, .-gcd
	.align	2
	.type	cancel, %function
cancel:
.LFB2:
	.cfi_startproc
	sub	sp, sp, #32	
	.cfi_def_cfa_offset 32
	str	w0, [sp, 28]	
	str	w1, [sp, 24]	
	str	x2, [sp, 16]	
	str	x3, [sp, 8]	
	ldr	w1, [sp, 28]	
	mov	w0, 52429	
	movk	w0, 0xcccc, lsl 16	
	umull	x0, w1, w0	
	lsr	x0, x0, 32	
	lsr	w2, w0, 3	
	mov	w0, w2	
	lsl	w0, w0, 2	
	add	w0, w0, w2	
	lsl	w0, w0, 1	
	sub	w2, w1, w0	
	ldr	w3, [sp, 24]	
	mov	w0, 52429	
	movk	w0, 0xcccc, lsl 16	
	umull	x0, w3, w0	
	lsr	x0, x0, 32	
	lsr	w1, w0, 3	
	mov	w0, w1	
	lsl	w0, w0, 2	
	add	w0, w0, w1	
	lsl	w0, w0, 1	
	sub	w1, w3, w0	
	cmp	w2, w1	
	bne	.L23		
	ldr	w1, [sp, 28]	
	mov	w0, 52429	
	movk	w0, 0xcccc, lsl 16	
	umull	x0, w1, w0	
	lsr	x0, x0, 32	
	lsr	w1, w0, 3	
	ldr	x0, [sp, 16]	
	str	w1, [x0]	
	ldr	w1, [sp, 24]	
	mov	w0, 52429	
	movk	w0, 0xcccc, lsl 16	
	umull	x0, w1, w0	
	lsr	x0, x0, 32	
	lsr	w1, w0, 3	
	ldr	x0, [sp, 8]	
	str	w1, [x0]	
	mov	w0, 1	
	b	.L24		
.L23:
	ldr	w2, [sp, 28]	
	mov	w0, 52429	
	movk	w0, 0xcccc, lsl 16	
	umull	x0, w2, w0	
	lsr	x0, x0, 32	
	lsr	w1, w0, 3	
	mov	w0, w1	
	lsl	w0, w0, 2	
	add	w0, w0, w1	
	lsl	w0, w0, 1	
	sub	w1, w2, w0	
	ldr	w2, [sp, 24]	
	mov	w0, 52429	
	movk	w0, 0xcccc, lsl 16	
	umull	x0, w2, w0	
	lsr	x0, x0, 32	
	lsr	w0, w0, 3	
	cmp	w1, w0	
	bne	.L25		
	ldr	w1, [sp, 28]	
	mov	w0, 52429	
	movk	w0, 0xcccc, lsl 16	
	umull	x0, w1, w0	
	lsr	x0, x0, 32	
	lsr	w1, w0, 3	
	ldr	x0, [sp, 16]	
	str	w1, [x0]	
	ldr	w2, [sp, 24]	
	mov	w0, 52429	
	movk	w0, 0xcccc, lsl 16	
	umull	x0, w2, w0	
	lsr	x0, x0, 32	
	lsr	w1, w0, 3	
	mov	w0, w1	
	lsl	w0, w0, 2	
	add	w0, w0, w1	
	lsl	w0, w0, 1	
	sub	w1, w2, w0	
	ldr	x0, [sp, 8]	
	str	w1, [x0]	
	mov	w0, 1	
	b	.L24		
.L25:
	ldr	w1, [sp, 28]	
	mov	w0, 52429	
	movk	w0, 0xcccc, lsl 16	
	umull	x0, w1, w0	
	lsr	x0, x0, 32	
	lsr	w3, w0, 3	
	ldr	w2, [sp, 24]	
	mov	w0, 52429	
	movk	w0, 0xcccc, lsl 16	
	umull	x0, w2, w0	
	lsr	x0, x0, 32	
	lsr	w1, w0, 3	
	mov	w0, w1	
	lsl	w0, w0, 2	
	add	w0, w0, w1	
	lsl	w0, w0, 1	
	sub	w1, w2, w0	
	cmp	w3, w1	
	bne	.L26		
	ldr	w2, [sp, 28]	
	mov	w0, 52429	
	movk	w0, 0xcccc, lsl 16	
	umull	x0, w2, w0	
	lsr	x0, x0, 32	
	lsr	w1, w0, 3	
	mov	w0, w1	
	lsl	w0, w0, 2	
	add	w0, w0, w1	
	lsl	w0, w0, 1	
	sub	w1, w2, w0	
	ldr	x0, [sp, 16]	
	str	w1, [x0]	
	ldr	w1, [sp, 24]	
	mov	w0, 52429	
	movk	w0, 0xcccc, lsl 16	
	umull	x0, w1, w0	
	lsr	x0, x0, 32	
	lsr	w1, w0, 3	
	ldr	x0, [sp, 8]	
	str	w1, [x0]	
	mov	w0, 1	
	b	.L24		
.L26:
	ldr	w1, [sp, 28]	
	mov	w0, 52429	
	movk	w0, 0xcccc, lsl 16	
	umull	x0, w1, w0	
	lsr	x0, x0, 32	
	lsr	w1, w0, 3	
	ldr	w2, [sp, 24]	
	mov	w0, 52429	
	movk	w0, 0xcccc, lsl 16	
	umull	x0, w2, w0	
	lsr	x0, x0, 32	
	lsr	w0, w0, 3	
	cmp	w1, w0	
	bne	.L27		
	ldr	w2, [sp, 28]	
	mov	w0, 52429	
	movk	w0, 0xcccc, lsl 16	
	umull	x0, w2, w0	
	lsr	x0, x0, 32	
	lsr	w1, w0, 3	
	mov	w0, w1	
	lsl	w0, w0, 2	
	add	w0, w0, w1	
	lsl	w0, w0, 1	
	sub	w1, w2, w0	
	ldr	x0, [sp, 16]	
	str	w1, [x0]	
	ldr	w2, [sp, 24]	
	mov	w0, 52429	
	movk	w0, 0xcccc, lsl 16	
	umull	x0, w2, w0	
	lsr	x0, x0, 32	
	lsr	w1, w0, 3	
	mov	w0, w1	
	lsl	w0, w0, 2	
	add	w0, w0, w1	
	lsl	w0, w0, 1	
	sub	w1, w2, w0	
	ldr	x0, [sp, 8]	
	str	w1, [x0]	
	mov	w0, 1	
	b	.L24		
.L27:
	ldr	x0, [sp, 16]	
	ldr	w1, [sp, 28]	
	str	w1, [x0]	
	ldr	x0, [sp, 8]	
	ldr	w1, [sp, 24]	
	str	w1, [x0]	
	mov	w0, 0	
.L24:
	add	sp, sp, 32	
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE2:
	.size	cancel, .-cancel
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
