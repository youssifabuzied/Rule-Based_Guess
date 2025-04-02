	.arch armv8-a
	.file	"problem48.c"
	.text
	.section	.rodata
	.align	3
.LC0:
	.string	"%llu\n"
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
	str	xzr, [sp, 32]	
	mov	w0, 1	
	str	w0, [sp, 24]	
	b	.L2		
.L5:
	mov	x0, 1	
	str	x0, [sp, 40]	
	str	wzr, [sp, 28]	
	b	.L3		
.L4:
	ldr	w1, [sp, 24]	
	ldr	x0, [sp, 40]	
	mul	x0, x1, x0	
	mov	x1, 54719	
	movk	x1, 0xbded, lsl 16	
	movk	x1, 0xfece, lsl 32	
	movk	x1, 0xdbe6, lsl 48	
	umulh	x1, x0, x1	
	lsr	x2, x1, 33	
	mov	x1, 58368	
	movk	x1, 0x540b, lsl 16	
	movk	x1, 0x2, lsl 32	
	mul	x1, x2, x1	
	sub	x0, x0, x1	
	str	x0, [sp, 40]	
	ldr	w0, [sp, 28]	
	add	w0, w0, 1	
	str	w0, [sp, 28]	
.L3:
	ldr	w1, [sp, 28]	
	ldr	w0, [sp, 24]	
	cmp	w1, w0	
	bcc	.L4		
	ldr	x1, [sp, 32]	
	ldr	x0, [sp, 40]	
	add	x0, x1, x0	
	mov	x1, 54719	
	movk	x1, 0xbded, lsl 16	
	movk	x1, 0xfece, lsl 32	
	movk	x1, 0xdbe6, lsl 48	
	umulh	x1, x0, x1	
	lsr	x2, x1, 33	
	mov	x1, 58368	
	movk	x1, 0x540b, lsl 16	
	movk	x1, 0x2, lsl 32	
	mul	x1, x2, x1	
	sub	x0, x0, x1	
	str	x0, [sp, 32]	
	ldr	w0, [sp, 24]	
	add	w0, w0, 1	
	str	w0, [sp, 24]	
.L2:
	ldr	w0, [sp, 24]	
	cmp	w0, 999	
	bls	.L5		
	ldr	x1, [sp, 32]	
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
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
