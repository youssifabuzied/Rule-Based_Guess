	.arch armv8-a
	.file	"problem28.c"
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
	str	w0, [sp, 24]	
	mov	w0, 3	
	str	w0, [sp, 28]	
	b	.L2		
.L3:
	ldr	w0, [sp, 28]	
	mul	w0, w0, w0	
	lsl	w1, w0, 1	
	ldr	w0, [sp, 28]	
	mov	w2, w0	
	lsl	w0, w0, 2	
	sub	w0, w2, w0	
	add	w0, w1, w0	
	add	w0, w0, 3	
	lsl	w0, w0, 1	
	ldr	w1, [sp, 24]	
	add	w0, w1, w0	
	str	w0, [sp, 24]	
	ldr	w0, [sp, 28]	
	add	w0, w0, 2	
	str	w0, [sp, 28]	
.L2:
	ldr	w0, [sp, 28]	
	cmp	w0, 1001	
	ble	.L3		
	ldr	w1, [sp, 24]	
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
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
