	.arch armv8-a
	.file	"problem15.c"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB20:
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
	add	x0, sp, 24	
	bl	__gmpz_init		
	add	x0, sp, 40	
	bl	__gmpz_init		
	add	x0, sp, 24	
	mov	x1, 40	
	bl	__gmpz_fac_ui		
	add	x0, sp, 40	
	mov	x1, 20	
	bl	__gmpz_fac_ui		
	add	x2, sp, 40	
	add	x1, sp, 40	
	add	x0, sp, 40	
	bl	__gmpz_mul		
	add	x2, sp, 40	
	add	x1, sp, 24	
	add	x0, sp, 24	
	bl	__gmpz_divexact		
	adrp	x0, :got:stdout	
	ldr	x0, [x0, #:got_lo12:stdout]	
	ldr	x0, [x0]	
	add	x1, sp, 24	
	mov	x2, x1	
	mov	w1, 10	
	bl	__gmpz_out_str		
	mov	w0, 10	
	bl	putchar		
	add	x0, sp, 24	
	bl	__gmpz_clear		
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
	beq	.L3		
	bl	__stack_chk_fail		
.L3:
	mov	w0, w1	
	ldp	x29, x30, [sp], 64	
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE20:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
