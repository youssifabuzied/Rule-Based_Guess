	.arch armv8-a
	.file	"problem30.c"
	.text
	.section	.rodata
	.align	3
.LC0:
	.string	"%d"
	.align	3
.LC1:
	.string	"%d\n"
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
	str	wzr, [sp, 28]	
	mov	w0, 10	
	str	w0, [sp, 24]	
	b	.L2		
.L6:
	str	wzr, [sp, 32]	
	add	x4, sp, 40	
	ldr	w3, [sp, 24]	
	adrp	x0, .LC0	
	add	x2, x0, :lo12:.LC0	
	mov	x1, 16	
	mov	x0, x4	
	bl	snprintf		
	str	wzr, [sp, 36]	
	b	.L3		
.L4:
	ldrsw	x0, [sp, 36]	
	add	x1, sp, 40	
	ldrb	w0, [x1, x0]	
	sub	w0, w0, #48	
	scvtf	d0, w0	
	fmov	d1, 5.0e+0	
	bl	pow		
	fmov	d1, d0	
	ldr	w0, [sp, 32]	
	scvtf	d0, w0	
	fadd	d0, d1, d0	
	fcvtzs	w0, d0	
	str	w0, [sp, 32]	
	ldr	w0, [sp, 36]	
	add	w0, w0, 1	
	str	w0, [sp, 36]	
.L3:
	ldrsw	x0, [sp, 36]	
	add	x1, sp, 40	
	ldrb	w0, [x1, x0]	
	cmp	w0, 0	
	bne	.L4		
	ldr	w1, [sp, 24]	
	ldr	w0, [sp, 32]	
	cmp	w1, w0	
	bne	.L5		
	ldr	w1, [sp, 28]	
	ldr	w0, [sp, 24]	
	add	w0, w1, w0	
	str	w0, [sp, 28]	
.L5:
	ldr	w0, [sp, 24]	
	add	w0, w0, 1	
	str	w0, [sp, 24]	
.L2:
	ldr	w1, [sp, 24]	
	mov	w0, 16959	
	movk	w0, 0xf, lsl 16	
	cmp	w1, w0	
	ble	.L6		
	ldr	w1, [sp, 28]	
	adrp	x0, .LC1	
	add	x0, x0, :lo12:.LC1	
	bl	printf		
	mov	w0, 0	
	mov	w1, w0	
	adrp	x0, :got:__stack_chk_guard	
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]	
	ldr	x3, [sp, 56]	
	ldr	x2, [x0]	
	subs	x3, x3, x2	
	mov	x2, 0	
	beq	.L8		
	bl	__stack_chk_fail		
.L8:
	mov	w0, w1	
	ldp	x29, x30, [sp], 64	
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
