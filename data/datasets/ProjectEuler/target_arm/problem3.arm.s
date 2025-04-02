	.arch armv8-a
	.file	"problem3.c"
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
	stp	x29, x30, [sp, -32]!	
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp	
	mov	x0, 60103	
	movk	x0, 0xe589, lsl 16	
	movk	x0, 0x8b, lsl 32	
	str	x0, [sp, 16]	
	mov	x0, 2	
	str	x0, [sp, 24]	
	b	.L2		
.L4:
	ldr	x1, [sp, 16]	
	ldr	x0, [sp, 24]	
	udiv	x0, x1, x0	
	str	x0, [sp, 16]	
.L3:
	ldr	x0, [sp, 16]	
	ldr	x1, [sp, 24]	
	udiv	x2, x0, x1	
	ldr	x1, [sp, 24]	
	mul	x1, x2, x1	
	sub	x0, x0, x1	
	cmp	x0, 0	
	beq	.L4		
	ldr	x0, [sp, 24]	
	add	x0, x0, 1	
	str	x0, [sp, 24]	
.L2:
	ldr	x1, [sp, 24]	
	ldr	x0, [sp, 16]	
	cmp	x1, x0	
	bcc	.L3		
	ldr	x1, [sp, 16]	
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
