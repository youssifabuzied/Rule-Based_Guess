	.arch armv8-a
	.file	"problem34.c"
	.text
	.section	.rodata
	.align	3
.LC0:
	.string	"%u"
	.align	3
.LC1:
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
	str	wzr, [sp, 28]	
	mov	w0, 3	
	str	w0, [sp, 24]	
	b	.L2		
.L6:
	str	wzr, [sp, 36]	
	add	x4, sp, 40	
	ldr	w3, [sp, 24]	
	adrp	x0, .LC0	
	add	x2, x0, :lo12:.LC0	
	mov	x1, 16	
	mov	x0, x4	
	bl	snprintf		
	str	wzr, [sp, 32]	
	b	.L3		
.L4:
	ldr	w0, [sp, 32]	
	add	x1, sp, 40	
	ldrb	w0, [x1, x0]	
	sub	w0, w0, #48	
	bl	fact		
	mov	w1, w0	
	ldr	w0, [sp, 36]	
	add	w0, w0, w1	
	str	w0, [sp, 36]	
	ldr	w0, [sp, 32]	
	add	w0, w0, 1	
	str	w0, [sp, 32]	
.L3:
	ldr	w0, [sp, 32]	
	add	x1, sp, 40	
	ldrb	w0, [x1, x0]	
	cmp	w0, 0	
	bne	.L4		
	ldr	w1, [sp, 24]	
	ldr	w0, [sp, 36]	
	cmp	w1, w0	
	bne	.L5		
	ldr	w1, [sp, 28]	
	ldr	w0, [sp, 36]	
	add	w0, w1, w0	
	str	w0, [sp, 28]	
.L5:
	ldr	w0, [sp, 24]	
	add	w0, w0, 1	
	str	w0, [sp, 24]	
.L2:
	ldr	w1, [sp, 24]	
	mov	w0, 34463	
	movk	w0, 0x1, lsl 16	
	cmp	w1, w0	
	bls	.L6		
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
	.align	2
	.global	fact
	.type	fact, %function
fact:
.LFB1:
	.cfi_startproc
	sub	sp, sp, #32	
	.cfi_def_cfa_offset 32
	str	w0, [sp, 12]	
	mov	w0, 1	
	str	w0, [sp, 28]	
	b	.L10		
.L11:
	ldr	w0, [sp, 12]	
	sub	w1, w0, #1	
	str	w1, [sp, 12]	
	ldr	w1, [sp, 28]	
	mul	w0, w1, w0	
	str	w0, [sp, 28]	
.L10:
	ldr	w0, [sp, 12]	
	cmp	w0, 0	
	bne	.L11		
	ldr	w0, [sp, 28]	
	add	sp, sp, 32	
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE1:
	.size	fact, .-fact
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
