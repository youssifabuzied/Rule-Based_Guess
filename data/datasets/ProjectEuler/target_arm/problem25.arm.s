	.arch armv8-a
	.file	"problem25.c"
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
.LFB26:
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
	str	w0, [sp, 20]	
	add	x0, sp, 40	
	bl	__gmpz_init		
	mov	w0, 1	
	str	w0, [sp, 20]	
.L4:
	ldrsw	x1, [sp, 20]	
	add	x0, sp, 40	
	bl	__gmpz_fib_ui		
	add	x0, sp, 40	
	mov	x2, x0	
	mov	w1, 10	
	mov	x0, 0	
	bl	__gmpz_get_str		
	str	x0, [sp, 24]	
	ldr	x0, [sp, 24]	
	bl	strlen		
	str	x0, [sp, 32]	
	ldr	x0, [sp, 24]	
	bl	free		
	ldr	x0, [sp, 32]	
	cmp	x0, 1000	
	bne	.L2		
	ldr	w1, [sp, 20]	
	adrp	x0, .LC0	
	add	x0, x0, :lo12:.LC0	
	bl	printf		
	nop	
	add	x0, sp, 40	
	bl	__gmpz_clear		
	mov	w0, 0	
	mov	w1, w0	
	adrp	x0, :got:__stack_chk_guard	
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]	
	ldr	x3, [sp, 56]	
	ldr	x2, [x0]	
	subs	x3, x3, x2	
	mov	x2, 0	
	beq	.L6		
	b	.L7		
.L2:
	ldr	w0, [sp, 20]	
	add	w0, w0, 1	
	str	w0, [sp, 20]	
	b	.L4		
.L7:
	bl	__stack_chk_fail		
.L6:
	mov	w0, w1	
	ldp	x29, x30, [sp], 64	
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE26:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
