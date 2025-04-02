	.arch armv8-a
	.file	"problem5.c"
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
.LFB0:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!	
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp	
	mov	x0, 1	
	str	x0, [sp, 16]	
	mov	x0, 1	
	str	x0, [sp, 24]	
	b	.L2		
.L3:
	ldr	x1, [sp, 24]	
	ldr	x0, [sp, 16]	
	bl	lcm		
	str	x0, [sp, 16]	
	ldr	x0, [sp, 24]	
	add	x0, x0, 1	
	str	x0, [sp, 24]	
.L2:
	ldr	x0, [sp, 24]	
	cmp	x0, 20	
	bls	.L3		
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
	.align	2
	.type	gcd, %function
gcd:
.LFB1:
	.cfi_startproc
	sub	sp, sp, #32	
	.cfi_def_cfa_offset 32
	str	x0, [sp, 8]	
	str	x1, [sp]	
	ldr	x1, [sp, 8]	
	ldr	x0, [sp]	
	cmp	x1, x0	
	bls	.L7		
	ldr	x0, [sp, 8]	
	str	x0, [sp, 16]	
	ldr	x0, [sp]	
	str	x0, [sp, 8]	
	ldr	x0, [sp, 16]	
	str	x0, [sp]	
	b	.L7		
.L8:
	ldr	x0, [sp]	
	str	x0, [sp, 8]	
	ldr	x0, [sp, 24]	
	str	x0, [sp]	
.L7:
	ldr	x0, [sp, 8]	
	ldr	x1, [sp]	
	udiv	x2, x0, x1	
	ldr	x1, [sp]	
	mul	x1, x2, x1	
	sub	x0, x0, x1	
	str	x0, [sp, 24]	
	ldr	x0, [sp, 24]	
	cmp	x0, 0	
	bne	.L8		
	ldr	x0, [sp]	
	add	sp, sp, 32	
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE1:
	.size	gcd, .-gcd
	.align	2
	.type	lcm, %function
lcm:
.LFB2:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!	
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp	
	str	x0, [sp, 24]	
	str	x1, [sp, 16]	
	ldr	x1, [sp, 24]	
	ldr	x0, [sp, 16]	
	mul	x0, x1, x0	
	str	x0, [sp, 40]	
	ldr	x1, [sp, 16]	
	ldr	x0, [sp, 24]	
	bl	gcd		
	mov	x1, x0	
	ldr	x0, [sp, 40]	
	udiv	x0, x0, x1	
	ldp	x29, x30, [sp], 48	
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE2:
	.size	lcm, .-lcm
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
