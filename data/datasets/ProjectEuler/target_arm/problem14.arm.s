	.arch armv8-a
	.file	"problem14.c"
	.text
	.section	.rodata
	.align	3
.LC0:
	.string	"%u\n"
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
	str	wzr, [sp, 20]	
	str	wzr, [sp, 24]	
	mov	w0, 1	
	str	w0, [sp, 16]	
	b	.L2		
.L4:
	ldr	w0, [sp, 16]	
	bl	collatz_count		
	str	w0, [sp, 28]	
	ldr	w1, [sp, 28]	
	ldr	w0, [sp, 20]	
	cmp	w1, w0	
	bls	.L3		
	ldr	w0, [sp, 28]	
	str	w0, [sp, 20]	
	ldr	w0, [sp, 16]	
	str	w0, [sp, 24]	
.L3:
	ldr	w0, [sp, 16]	
	add	w0, w0, 1	
	str	w0, [sp, 16]	
.L2:
	ldr	w1, [sp, 16]	
	mov	w0, 16959	
	movk	w0, 0xf, lsl 16	
	cmp	w1, w0	
	bls	.L4		
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
	.align	2
	.type	collatz_count, %function
collatz_count:
.LFB1:
	.cfi_startproc
	sub	sp, sp, #32	
	.cfi_def_cfa_offset 32
	str	w0, [sp, 12]	
	str	wzr, [sp, 28]	
	b	.L7		
.L10:
	ldr	w0, [sp, 12]	
	and	w0, w0, 1	
	cmp	w0, 0	
	bne	.L8		
	ldr	w0, [sp, 12]	
	lsr	w0, w0, 1	
	b	.L9		
.L8:
	ldr	w1, [sp, 12]	
	mov	w0, w1	
	lsl	w0, w0, 1	
	add	w0, w0, w1	
	add	w0, w0, 1	
.L9:
	str	w0, [sp, 12]	
	ldr	w0, [sp, 28]	
	add	w0, w0, 1	
	str	w0, [sp, 28]	
.L7:
	ldr	w0, [sp, 12]	
	cmp	w0, 1	
	bhi	.L10		
	ldr	w0, [sp, 28]	
	add	w0, w0, 1	
	add	sp, sp, 32	
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE1:
	.size	collatz_count, .-collatz_count
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
