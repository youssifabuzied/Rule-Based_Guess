	.arch armv8-a
	.file	"problem1.c"
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
	str	wzr, [sp, 16]	
	str	wzr, [sp, 20]	
	str	wzr, [sp, 24]	
	str	wzr, [sp, 28]	
	b	.L2		
.L6:
	ldr	w2, [sp, 28]	
	mov	w0, 21846	
	movk	w0, 0x5555, lsl 16	
	smull	x0, w2, w0	
	lsr	x1, x0, 32	
	asr	w0, w2, 31	
	sub	w1, w1, w0	
	mov	w0, w1	
	lsl	w0, w0, 1	
	add	w0, w0, w1	
	sub	w1, w2, w0	
	cmp	w1, 0	
	bne	.L3		
	ldr	w1, [sp, 16]	
	ldr	w0, [sp, 28]	
	add	w0, w1, w0	
	str	w0, [sp, 16]	
.L3:
	ldr	w2, [sp, 28]	
	mov	w0, 26215	
	movk	w0, 0x6666, lsl 16	
	smull	x0, w2, w0	
	lsr	x0, x0, 32	
	asr	w1, w0, 1	
	asr	w0, w2, 31	
	sub	w1, w1, w0	
	mov	w0, w1	
	lsl	w0, w0, 2	
	add	w0, w0, w1	
	sub	w1, w2, w0	
	cmp	w1, 0	
	bne	.L4		
	ldr	w1, [sp, 20]	
	ldr	w0, [sp, 28]	
	add	w0, w1, w0	
	str	w0, [sp, 20]	
.L4:
	ldr	w0, [sp, 28]	
	mov	w1, 34953	
	movk	w1, 0x8888, lsl 16	
	smull	x1, w0, w1	
	lsr	x1, x1, 32	
	add	w1, w0, w1	
	asr	w2, w1, 3	
	asr	w1, w0, 31	
	sub	w2, w2, w1	
	mov	w1, w2	
	lsl	w1, w1, 4	
	sub	w1, w1, w2	
	sub	w2, w0, w1	
	cmp	w2, 0	
	bne	.L5		
	ldr	w1, [sp, 24]	
	ldr	w0, [sp, 28]	
	add	w0, w1, w0	
	str	w0, [sp, 24]	
.L5:
	ldr	w0, [sp, 28]	
	add	w0, w0, 1	
	str	w0, [sp, 28]	
.L2:
	ldr	w0, [sp, 28]	
	cmp	w0, 999	
	ble	.L6		
	ldr	w1, [sp, 16]	
	ldr	w0, [sp, 20]	
	add	w1, w1, w0	
	ldr	w0, [sp, 24]	
	sub	w0, w1, w0	
	mov	w1, w0	
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
