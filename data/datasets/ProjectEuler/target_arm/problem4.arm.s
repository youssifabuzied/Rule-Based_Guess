	.arch armv8-a
	.file	"problem4.c"
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
	str	wzr, [sp, 24]	
	mov	w0, 100	
	str	w0, [sp, 16]	
	b	.L2		
.L6:
	mov	w0, 100	
	str	w0, [sp, 20]	
	b	.L3		
.L5:
	ldr	w1, [sp, 16]	
	ldr	w0, [sp, 20]	
	mul	w0, w1, w0	
	str	w0, [sp, 28]	
	ldr	w0, [sp, 28]	
	bl	is_palindromic		
	cmp	w0, 0	
	beq	.L4		
	ldr	w1, [sp, 28]	
	ldr	w0, [sp, 24]	
	cmp	w1, w0	
	bls	.L4		
	ldr	w0, [sp, 28]	
	str	w0, [sp, 24]	
.L4:
	ldr	w0, [sp, 20]	
	add	w0, w0, 1	
	str	w0, [sp, 20]	
.L3:
	ldr	w0, [sp, 20]	
	cmp	w0, 999	
	bls	.L5		
	ldr	w0, [sp, 16]	
	add	w0, w0, 1	
	str	w0, [sp, 16]	
.L2:
	ldr	w0, [sp, 16]	
	cmp	w0, 999	
	bls	.L6		
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
	.type	is_palindromic, %function
is_palindromic:
.LFB1:
	.cfi_startproc
	sub	sp, sp, #32	
	.cfi_def_cfa_offset 32
	str	w0, [sp, 12]	
	str	wzr, [sp, 24]	
	ldr	w0, [sp, 12]	
	str	w0, [sp, 28]	
	b	.L9		
.L10:
	ldr	w1, [sp, 24]	
	mov	w0, w1	
	lsl	w0, w0, 2	
	add	w0, w0, w1	
	lsl	w0, w0, 1	
	mov	w3, w0	
	ldr	w2, [sp, 28]	
	mov	w0, 52429	
	movk	w0, 0xcccc, lsl 16	
	umull	x0, w2, w0	
	lsr	x0, x0, 32	
	lsr	w1, w0, 3	
	mov	w0, w1	
	lsl	w0, w0, 2	
	add	w0, w0, w1	
	lsl	w0, w0, 1	
	sub	w1, w2, w0	
	add	w0, w3, w1	
	str	w0, [sp, 24]	
	ldr	w1, [sp, 28]	
	mov	w0, 52429	
	movk	w0, 0xcccc, lsl 16	
	umull	x0, w1, w0	
	lsr	x0, x0, 32	
	lsr	w0, w0, 3	
	str	w0, [sp, 28]	
.L9:
	ldr	w0, [sp, 28]	
	cmp	w0, 0	
	bne	.L10		
	ldr	w1, [sp, 24]	
	ldr	w0, [sp, 12]	
	cmp	w1, w0	
	cset	w0, eq	
	and	w0, w0, 255	
	add	sp, sp, 32	
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE1:
	.size	is_palindromic, .-is_palindromic
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
