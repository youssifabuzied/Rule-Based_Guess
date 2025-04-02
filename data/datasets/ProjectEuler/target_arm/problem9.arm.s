	.arch armv8-a
	.file	"problem9.c"
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
	mov	w0, 1	
	str	w0, [sp, 20]	
	b	.L2		
.L6:
	ldr	w0, [sp, 20]	
	str	w0, [sp, 24]	
	b	.L3		
.L5:
	mov	w1, 1000	
	ldr	w0, [sp, 20]	
	sub	w1, w1, w0	
	ldr	w0, [sp, 24]	
	sub	w0, w1, w0	
	str	w0, [sp, 28]	
	ldr	w0, [sp, 20]	
	mul	w1, w0, w0	
	ldr	w0, [sp, 24]	
	mul	w0, w0, w0	
	add	w1, w1, w0	
	ldr	w0, [sp, 28]	
	mul	w0, w0, w0	
	cmp	w1, w0	
	bne	.L4		
	ldr	w1, [sp, 20]	
	ldr	w0, [sp, 24]	
	mul	w1, w1, w0	
	ldr	w0, [sp, 28]	
	mul	w0, w1, w0	
	mov	w1, w0	
	adrp	x0, .LC0	
	add	x0, x0, :lo12:.LC0	
	bl	printf		
.L4:
	ldr	w0, [sp, 24]	
	add	w0, w0, 1	
	str	w0, [sp, 24]	
.L3:
	ldr	w0, [sp, 24]	
	cmp	w0, 666	
	ble	.L5		
	ldr	w0, [sp, 20]	
	add	w0, w0, 1	
	str	w0, [sp, 20]	
.L2:
	ldr	w0, [sp, 20]	
	cmp	w0, 333	
	ble	.L6		
	mov	w0, 0	
	ldp	x29, x30, [sp], 32	
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
