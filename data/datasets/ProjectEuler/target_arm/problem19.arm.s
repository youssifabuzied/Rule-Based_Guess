	.arch armv8-a
	.file	"problem19.c"
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
	str	wzr, [sp, 20]	
	str	wzr, [sp, 24]	
	mov	w0, 1901	
	str	w0, [sp, 16]	
	b	.L2		
.L6:
	mov	w0, 1	
	str	w0, [sp, 28]	
	b	.L3		
.L5:
	ldr	w0, [sp, 20]	
	cmp	w0, 5	
	bne	.L4		
	ldr	w0, [sp, 24]	
	add	w0, w0, 1	
	str	w0, [sp, 24]	
.L4:
	ldr	w1, [sp, 28]	
	ldr	w0, [sp, 16]	
	bl	days		
	mov	w1, w0	
	ldr	w0, [sp, 20]	
	add	w0, w1, w0	
	mov	w1, 9363	
	movk	w1, 0x9249, lsl 16	
	smull	x1, w0, w1	
	lsr	x1, x1, 32	
	add	w1, w0, w1	
	asr	w2, w1, 2	
	asr	w1, w0, 31	
	sub	w2, w2, w1	
	mov	w1, w2	
	lsl	w1, w1, 3	
	sub	w1, w1, w2	
	sub	w0, w0, w1	
	str	w0, [sp, 20]	
	ldr	w0, [sp, 28]	
	add	w0, w0, 1	
	str	w0, [sp, 28]	
.L3:
	ldr	w0, [sp, 28]	
	cmp	w0, 12	
	ble	.L5		
	ldr	w0, [sp, 16]	
	add	w0, w0, 1	
	str	w0, [sp, 16]	
.L2:
	ldr	w0, [sp, 16]	
	cmp	w0, 2000	
	ble	.L6		
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
	.type	days, %function
days:
.LFB1:
	.cfi_startproc
	sub	sp, sp, #16	
	.cfi_def_cfa_offset 16
	str	w0, [sp, 12]	
	str	w1, [sp, 8]	
	ldr	w0, [sp, 8]	
	cmp	w0, 11	
	cset	w1, hi	
	and	w1, w1, 255	
	cmp	w1, 0	
	bne	.L9		
	mov	x1, 1	
	lsl	x0, x1, x0	
	mov	x1, 2640	
	and	x1, x0, x1	
	cmp	x1, 0	
	cset	w1, ne	
	and	w1, w1, 255	
	cmp	w1, 0	
	bne	.L10		
	and	x0, x0, 4	
	cmp	x0, 0	
	cset	w0, ne	
	and	w0, w0, 255	
	cmp	w0, 0	
	beq	.L9		
	ldr	w0, [sp, 12]	
	and	w0, w0, 3	
	cmp	w0, 0	
	bne	.L11		
	ldr	w1, [sp, 12]	
	mov	w0, 34079	
	movk	w0, 0x51eb, lsl 16	
	smull	x0, w1, w0	
	lsr	x0, x0, 32	
	asr	w2, w0, 5	
	asr	w0, w1, 31	
	sub	w0, w2, w0	
	mov	w2, 100	
	mul	w0, w0, w2	
	sub	w0, w1, w0	
	cmp	w0, 0	
	bne	.L12		
.L11:
	ldr	w1, [sp, 12]	
	mov	w0, 34079	
	movk	w0, 0x51eb, lsl 16	
	smull	x0, w1, w0	
	lsr	x0, x0, 32	
	asr	w2, w0, 7	
	asr	w0, w1, 31	
	sub	w0, w2, w0	
	mov	w2, 400	
	mul	w0, w0, w2	
	sub	w0, w1, w0	
	cmp	w0, 0	
	bne	.L13		
.L12:
	mov	w0, 29	
	b	.L14		
.L13:
	mov	w0, 28	
	b	.L14		
.L10:
	mov	w0, 30	
	b	.L14		
.L9:
	mov	w0, 31	
.L14:
	add	sp, sp, 16	
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE1:
	.size	days, .-days
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
