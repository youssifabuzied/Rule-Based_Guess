	.arch armv8-a
	.file	"problem10.c"
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
.LFB6:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!	
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp	
	mov	x0, 33920	
	movk	x0, 0x1e, lsl 16	
	str	x0, [sp, 32]	
	str	xzr, [sp, 24]	
	mov	x1, 1	
	ldr	x0, [sp, 32]	
	bl	calloc		
	str	x0, [sp, 40]	
	mov	w0, 2	
	str	w0, [sp, 16]	
	b	.L2		
.L6:
	ldr	w0, [sp, 16]	
	ldr	x1, [sp, 40]	
	add	x0, x1, x0	
	ldrb	w0, [x0]	
	cmp	w0, 0	
	bne	.L3		
	ldr	w0, [sp, 16]	
	ldr	x1, [sp, 24]	
	add	x0, x1, x0	
	str	x0, [sp, 24]	
	ldr	w0, [sp, 16]	
	lsl	w0, w0, 1	
	str	w0, [sp, 20]	
	b	.L4		
.L5:
	ldr	w0, [sp, 20]	
	ldr	x1, [sp, 40]	
	add	x0, x1, x0	
	mov	w1, 1	
	strb	w1, [x0]	
	ldr	w1, [sp, 20]	
	ldr	w0, [sp, 16]	
	add	w0, w1, w0	
	str	w0, [sp, 20]	
.L4:
	ldr	w0, [sp, 20]	
	ldr	x1, [sp, 32]	
	cmp	x1, x0	
	bhi	.L5		
.L3:
	ldr	w0, [sp, 16]	
	add	w0, w0, 1	
	str	w0, [sp, 16]	
.L2:
	ldr	w0, [sp, 16]	
	ldr	x1, [sp, 32]	
	cmp	x1, x0	
	bhi	.L6		
	ldr	x0, [sp, 40]	
	bl	free		
	ldr	x1, [sp, 24]	
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
.LFE6:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
