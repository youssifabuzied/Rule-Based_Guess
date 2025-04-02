	.arch armv8-a
	.file	"problem16.c"
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
.LFB26:
	.cfi_startproc
	stp	x29, x30, [sp, -80]!	
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	mov	x29, sp	
	adrp	x0, :got:__stack_chk_guard	
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]	
	ldr	x1, [x0]	
	str	x1, [sp, 72]	
	mov	x1, 0	
	str	wzr, [sp, 28]	
	add	x0, sp, 56	
	bl	__gmpz_init		
	add	x0, sp, 56	
	mov	x2, 1000	
	mov	x1, 2	
	bl	__gmpz_ui_pow_ui		
	add	x0, sp, 56	
	mov	x2, x0	
	mov	w1, 10	
	mov	x0, 0	
	bl	__gmpz_get_str		
	str	x0, [sp, 40]	
	add	x0, sp, 56	
	mov	w1, 10	
	bl	__gmpz_sizeinbase		
	str	x0, [sp, 48]	
	str	xzr, [sp, 32]	
	b	.L2		
.L3:
	ldr	x1, [sp, 40]	
	ldr	x0, [sp, 32]	
	add	x0, x1, x0	
	ldrb	w0, [x0]	
	mov	w1, w0	
	ldr	w0, [sp, 28]	
	add	w0, w1, w0	
	sub	w0, w0, #48	
	str	w0, [sp, 28]	
	ldr	x0, [sp, 32]	
	add	x0, x0, 1	
	str	x0, [sp, 32]	
.L2:
	ldr	x1, [sp, 32]	
	ldr	x0, [sp, 48]	
	cmp	x1, x0	
	bcc	.L3		
	ldr	w1, [sp, 28]	
	adrp	x0, .LC0	
	add	x0, x0, :lo12:.LC0	
	bl	printf		
	ldr	x0, [sp, 40]	
	bl	free		
	add	x0, sp, 56	
	bl	__gmpz_clear		
	mov	w0, 0	
	mov	w1, w0	
	adrp	x0, :got:__stack_chk_guard	
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]	
	ldr	x3, [sp, 72]	
	ldr	x2, [x0]	
	subs	x3, x3, x2	
	mov	x2, 0	
	beq	.L5		
	bl	__stack_chk_fail		
.L5:
	mov	w0, w1	
	ldp	x29, x30, [sp], 80	
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE26:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
