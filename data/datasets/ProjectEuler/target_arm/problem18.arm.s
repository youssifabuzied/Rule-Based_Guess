	.arch armv8-a
	.file	"problem18.c"
	.text
	.section	.rodata
	.align	3
.LC1:
	.string	"%d\n"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB0:
	.cfi_startproc
	stp	x29, x30, [sp, -256]!	
	.cfi_def_cfa_offset 256
	.cfi_offset 29, -256
	.cfi_offset 30, -248
	mov	x29, sp	
	adrp	x0, :got:__stack_chk_guard	
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]	
	ldr	x1, [x0]	
	str	x1, [sp, 248]	
	mov	x1, 0	
	adrp	x0, .LC0	
	add	x1, x0, :lo12:.LC0	
	add	x0, sp, 16	
	ldp	q0, q1, [x1]	
	stp	q0, q1, [x0]	
	ldp	q0, q1, [x1, 32]	
	stp	q0, q1, [x0, 32]	
	ldp	q0, q1, [x1, 64]	
	stp	q0, q1, [x0, 64]	
	ldp	q0, q1, [x1, 96]	
	stp	q0, q1, [x0, 96]	
	ldp	q0, q1, [x1, 128]	
	stp	q0, q1, [x0, 128]	
	ldp	q0, q1, [x1, 160]	
	stp	q0, q1, [x0, 160]	
	ldp	q0, q1, [x1, 192]	
	stp	q0, q1, [x0, 192]	
	ldrb	w1, [x1, 224]	
	strb	w1, [x0, 224]	
	add	x0, sp, 16	
	mov	w2, 0	
	mov	w1, 0	
	bl	findmax		
	mov	w1, w0	
	adrp	x0, .LC1	
	add	x0, x0, :lo12:.LC1	
	bl	printf		
	mov	w0, 0	
	mov	w1, w0	
	adrp	x0, :got:__stack_chk_guard	
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]	
	ldr	x3, [sp, 248]	
	ldr	x2, [x0]	
	subs	x3, x3, x2	
	mov	x2, 0	
	beq	.L3		
	bl	__stack_chk_fail		
.L3:
	mov	w0, w1	
	ldp	x29, x30, [sp], 256	
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.rodata
	.align	3
.LC0:
	.string	"K"
	.zero	13
	.string	"_@"
	.zero	12
	.string	"\021/R"
	.zero	11
	.string	"\022#W\n"
	.zero	10
	.string	"\024\004R/A"
	.zero	9
	.string	"\023\001\027K\003\""
	.zero	8
	.string	"X\002MI\007?C"
	.zero	7
	.string	"cA\004\034\006\020F\\"
	.zero	6
	.string	"))\0328S(PF!"
	.zero	5
	.string	")0H!/ %\020^\035"
	.zero	4
	.string	"5G,A\031+[4a3\016"
	.zero	3
	.string	"F\013!\034MI\021N'D\0219"
	.zero	2
	.string	"[G4&\021\016[+:2\033\0350"
	.zero	1
	.string	"?B\004DY5C\036I\020EW(\037"
	.ascii	"\004>b\033\027\tFbI]&5<\004\027"
	.text
	.align	2
	.type	findmax, %function
findmax:
.LFB1:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!	
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp	
	str	x0, [sp, 24]	
	str	w1, [sp, 20]	
	str	w2, [sp, 16]	
	ldr	w0, [sp, 20]	
	cmp	w0, 14	
	bne	.L5		
	ldrsw	x1, [sp, 20]	
	mov	x0, x1	
	lsl	x0, x0, 4	
	sub	x0, x0, x1	
	ldr	x1, [sp, 24]	
	add	x1, x1, x0	
	ldrsw	x0, [sp, 16]	
	ldrb	w0, [x1, x0]	
	b	.L6		
.L5:
	ldr	w0, [sp, 20]	
	add	w0, w0, 1	
	ldr	w2, [sp, 16]	
	mov	w1, w0	
	ldr	x0, [sp, 24]	
	bl	findmax		
	str	w0, [sp, 40]	
	ldr	w0, [sp, 20]	
	add	w1, w0, 1	
	ldr	w0, [sp, 16]	
	add	w0, w0, 1	
	mov	w2, w0	
	ldr	x0, [sp, 24]	
	bl	findmax		
	str	w0, [sp, 44]	
	ldrsw	x1, [sp, 20]	
	mov	x0, x1	
	lsl	x0, x0, 4	
	sub	x0, x0, x1	
	ldr	x1, [sp, 24]	
	add	x1, x1, x0	
	ldrsw	x0, [sp, 16]	
	ldrb	w0, [x1, x0]	
	mov	w3, w0	
	ldr	w0, [sp, 40]	
	ldr	w2, [sp, 44]	
	ldr	w1, [sp, 44]	
	cmp	w2, w0	
	csel	w0, w1, w0, ge	
	add	w0, w3, w0	
.L6:
	ldp	x29, x30, [sp], 48	
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE1:
	.size	findmax, .-findmax
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
