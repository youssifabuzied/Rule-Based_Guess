	.arch armv8-a
	.file	"problem40.c"
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
	stp	x29, x30, [sp, -96]!	
	.cfi_def_cfa_offset 96
	.cfi_offset 29, -96
	.cfi_offset 30, -88
	mov	x29, sp	
	str	d8, [sp, 16]	
	.cfi_offset 72, -80
	adrp	x0, :got:__stack_chk_guard	
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]	
	ldr	x1, [x0]	
	str	x1, [sp, 88]	
	mov	x1, 0	
	mov	w0, 1	
	str	w0, [sp, 32]	
	mov	w0, 1	
	str	w0, [sp, 44]	
	mov	w0, 1	
	str	w0, [sp, 36]	
	str	wzr, [sp, 40]	
	b	.L2		
.L6:
	ldr	w0, [sp, 36]	
	scvtf	d0, w0	
	bl	log10		
	fmov	d1, d0	
	fmov	d0, 1.0e+0	
	fadd	d0, d1, d0	
	fcvtzs	w0, d0	
	str	w0, [sp, 52]	
	str	wzr, [sp, 48]	
	b	.L3		
.L5:
	ldr	w0, [sp, 32]	
	scvtf	d8, w0	
	ldr	w0, [sp, 40]	
	scvtf	d0, w0	
	fmov	d1, d0	
	fmov	d0, 1.0e+1	
	bl	pow		
	fcmp	d8, d0	
	bne	.L4		
	ldr	w1, [sp, 52]	
	ldr	w0, [sp, 48]	
	sub	w0, w1, w0	
	sub	w0, w0, #1	
	scvtf	d0, w0	
	fmov	d1, d0	
	fmov	d0, 1.0e+1	
	bl	pow		
	fcvtzs	w0, d0	
	ldr	w1, [sp, 36]	
	sdiv	w2, w1, w0	
	ldr	w3, [sp, 40]	
	add	w0, w3, 1	
	str	w0, [sp, 40]	
	mov	w0, 26215	
	movk	w0, 0x6666, lsl 16	
	smull	x0, w2, w0	
	lsr	x0, x0, 32	
	asr	w1, w0, 2	
	asr	w0, w2, 31	
	sub	w1, w1, w0	
	mov	w0, w1	
	lsl	w0, w0, 2	
	add	w0, w0, w1	
	lsl	w0, w0, 1	
	sub	w1, w2, w0	
	sxtw	x0, w3	
	lsl	x0, x0, 2	
	add	x2, sp, 56	
	str	w1, [x2, x0]	
.L4:
	ldr	w0, [sp, 48]	
	add	w0, w0, 1	
	str	w0, [sp, 48]	
	ldr	w0, [sp, 32]	
	add	w0, w0, 1	
	str	w0, [sp, 32]	
.L3:
	ldr	w1, [sp, 48]	
	ldr	w0, [sp, 52]	
	cmp	w1, w0	
	blt	.L5		
	ldr	w0, [sp, 36]	
	add	w0, w0, 1	
	str	w0, [sp, 36]	
.L2:
	ldr	w0, [sp, 40]	
	cmp	w0, 6	
	ble	.L6		
	str	wzr, [sp, 36]	
	b	.L7		
.L8:
	ldrsw	x0, [sp, 36]	
	lsl	x0, x0, 2	
	add	x1, sp, 56	
	ldr	w0, [x1, x0]	
	ldr	w1, [sp, 44]	
	mul	w0, w1, w0	
	str	w0, [sp, 44]	
	ldr	w0, [sp, 36]	
	add	w0, w0, 1	
	str	w0, [sp, 36]	
.L7:
	ldr	w1, [sp, 36]	
	ldr	w0, [sp, 40]	
	cmp	w1, w0	
	blt	.L8		
	ldr	w1, [sp, 44]	
	adrp	x0, .LC0	
	add	x0, x0, :lo12:.LC0	
	bl	printf		
	mov	w0, 0	
	mov	w1, w0	
	adrp	x0, :got:__stack_chk_guard	
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]	
	ldr	x3, [sp, 88]	
	ldr	x2, [x0]	
	subs	x3, x3, x2	
	mov	x2, 0	
	beq	.L10		
	bl	__stack_chk_fail		
.L10:
	mov	w0, w1	
	ldr	d8, [sp, 16]	
	ldp	x29, x30, [sp], 96	
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 72
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
