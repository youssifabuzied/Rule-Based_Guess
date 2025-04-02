	.arch armv8-a
	.file	"problem36.c"
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
	stp	x29, x30, [sp, -32]!	
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp	
	str	wzr, [sp, 28]	
	mov	w0, 1	
	str	w0, [sp, 24]	
	b	.L2		
.L4:
	mov	w1, 10	
	ldr	w0, [sp, 24]	
	bl	palindromic_base		
	cmp	w0, 0	
	beq	.L3		
	mov	w1, 2	
	ldr	w0, [sp, 24]	
	bl	palindromic_base		
	cmp	w0, 0	
	beq	.L3		
	ldr	w1, [sp, 28]	
	ldr	w0, [sp, 24]	
	add	w0, w1, w0	
	str	w0, [sp, 28]	
.L3:
	ldr	w0, [sp, 24]	
	add	w0, w0, 1	
	str	w0, [sp, 24]	
.L2:
	ldr	w1, [sp, 24]	
	mov	w0, 16959	
	movk	w0, 0xf, lsl 16	
	cmp	w1, w0	
	ble	.L4		
	ldr	w1, [sp, 28]	
	adrp	x0, .LC0	
	add	x0, x0, :lo12:.LC0	
	bl	printf		
	mov	w0, 0	
	ldp	x29, x30, [sp], 32	
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.align	2
	.type	palindromic_base, %function
palindromic_base:
.LFB1:
	.cfi_startproc
	sub	sp, sp, #32	
	.cfi_def_cfa_offset 32
	str	w0, [sp, 12]	
	str	w1, [sp, 8]	
	str	wzr, [sp, 24]	
	ldr	w0, [sp, 12]	
	str	w0, [sp, 28]	
	b	.L7		
.L8:
	ldr	w1, [sp, 8]	
	ldr	w0, [sp, 24]	
	mul	w1, w1, w0	
	ldr	w0, [sp, 12]	
	ldr	w2, [sp, 8]	
	sdiv	w3, w0, w2	
	ldr	w2, [sp, 8]	
	mul	w2, w3, w2	
	sub	w0, w0, w2	
	add	w0, w1, w0	
	str	w0, [sp, 24]	
	ldr	w1, [sp, 12]	
	ldr	w0, [sp, 8]	
	sdiv	w0, w1, w0	
	str	w0, [sp, 12]	
.L7:
	ldr	w0, [sp, 12]	
	cmp	w0, 0	
	bne	.L8		
	ldr	w1, [sp, 28]	
	ldr	w0, [sp, 24]	
	cmp	w1, w0	
	cset	w0, eq	
	and	w0, w0, 255	
	add	sp, sp, 32	
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE1:
	.size	palindromic_base, .-palindromic_base
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
