	.arch armv8-a
	.file	"problem7.c"
	.text
	.section	.rodata
	.align	3
.LC0:
	.string	"%lu\n"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB6:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!	
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp	
	str	wzr, [sp, 24]	
	mov	x0, 16960	
	movk	x0, 0xf, lsl 16	
	str	x0, [sp, 48]	
	mov	w0, 10001	
	str	w0, [sp, 28]	
	mov	x1, 1	
	ldr	x0, [sp, 48]	
	bl	calloc		
	str	x0, [sp, 56]	
	mov	x0, 2	
	str	x0, [sp, 32]	
	b	.L2		
.L8:
	ldr	x1, [sp, 56]	
	ldr	x0, [sp, 32]	
	add	x0, x1, x0	
	ldrb	w0, [x0]	
	cmp	w0, 0	
	bne	.L3		
	ldr	w0, [sp, 24]	
	add	w0, w0, 1	
	str	w0, [sp, 24]	
	ldr	w1, [sp, 24]	
	ldr	w0, [sp, 28]	
	cmp	w1, w0	
	bne	.L4		
	ldr	x1, [sp, 32]	
	adrp	x0, .LC0	
	add	x0, x0, :lo12:.LC0	
	bl	printf		
	b	.L5		
.L4:
	ldr	x0, [sp, 32]	
	lsl	x0, x0, 1	
	str	x0, [sp, 40]	
	b	.L6		
.L7:
	ldr	x1, [sp, 56]	
	ldr	x0, [sp, 40]	
	add	x0, x1, x0	
	mov	w1, 1	
	strb	w1, [x0]	
	ldr	x1, [sp, 40]	
	ldr	x0, [sp, 32]	
	add	x0, x1, x0	
	str	x0, [sp, 40]	
.L6:
	ldr	x1, [sp, 40]	
	ldr	x0, [sp, 48]	
	cmp	x1, x0	
	bcc	.L7		
.L3:
	ldr	x0, [sp, 32]	
	add	x0, x0, 1	
	str	x0, [sp, 32]	
.L2:
	ldr	x1, [sp, 32]	
	ldr	x0, [sp, 48]	
	cmp	x1, x0	
	bcc	.L8		
.L5:
	ldr	x0, [sp, 56]	
	bl	free		
	mov	w0, 0	
	ldp	x29, x30, [sp], 64	
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
