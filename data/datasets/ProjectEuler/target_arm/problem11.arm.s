	.arch armv8-a
	.file	"problem11.c"
	.text
	.section	.rodata
	.align	3
.LC1:
	.string	"%u\n"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB0:
	.cfi_startproc
	sub	sp, sp, #1664	
	.cfi_def_cfa_offset 1664
	stp	x29, x30, [sp]	
	.cfi_offset 29, -1664
	.cfi_offset 30, -1656
	mov	x29, sp	
	adrp	x0, :got:__stack_chk_guard	
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]	
	ldr	x1, [x0]	
	str	x1, [sp, 1656]	
	mov	x1, 0	
	adrp	x0, .LC0	
	add	x1, x0, :lo12:.LC0	
	add	x0, sp, 56	
	mov	x3, x1	
	mov	x1, 1600	
	mov	x2, x1	
	mov	x1, x3	
	bl	memcpy		
	str	wzr, [sp, 28]	
	str	wzr, [sp, 32]	
	b	.L2		
.L5:
	str	wzr, [sp, 36]	
	b	.L3		
.L4:
	ldr	w2, [sp, 36]	
	ldr	w1, [sp, 32]	
	mov	x0, x1	
	lsl	x0, x0, 2	
	add	x0, x0, x1	
	lsl	x0, x0, 2	
	add	x0, x0, x2	
	lsl	x0, x0, 2	
	add	x1, sp, 56	
	ldr	w2, [x1, x0]	
	ldr	w0, [sp, 36]	
	add	w0, w0, 1	
	uxtw	x3, w0	
	ldr	w1, [sp, 32]	
	mov	x0, x1	
	lsl	x0, x0, 2	
	add	x0, x0, x1	
	lsl	x0, x0, 2	
	add	x0, x0, x3	
	lsl	x0, x0, 2	
	add	x1, sp, 56	
	ldr	w0, [x1, x0]	
	mul	w2, w2, w0	
	ldr	w0, [sp, 36]	
	add	w0, w0, 2	
	uxtw	x3, w0	
	ldr	w1, [sp, 32]	
	mov	x0, x1	
	lsl	x0, x0, 2	
	add	x0, x0, x1	
	lsl	x0, x0, 2	
	add	x0, x0, x3	
	lsl	x0, x0, 2	
	add	x1, sp, 56	
	ldr	w0, [x1, x0]	
	mul	w2, w2, w0	
	ldr	w0, [sp, 36]	
	add	w0, w0, 3	
	uxtw	x3, w0	
	ldr	w1, [sp, 32]	
	mov	x0, x1	
	lsl	x0, x0, 2	
	add	x0, x0, x1	
	lsl	x0, x0, 2	
	add	x0, x0, x3	
	lsl	x0, x0, 2	
	add	x1, sp, 56	
	ldr	w0, [x1, x0]	
	mul	w0, w2, w0	
	str	w0, [sp, 40]	
	ldr	w2, [sp, 32]	
	ldr	w1, [sp, 36]	
	mov	x0, x1	
	lsl	x0, x0, 2	
	add	x0, x0, x1	
	lsl	x0, x0, 2	
	add	x0, x0, x2	
	lsl	x0, x0, 2	
	add	x1, sp, 56	
	ldr	w2, [x1, x0]	
	ldr	w0, [sp, 36]	
	add	w0, w0, 1	
	ldr	w3, [sp, 32]	
	uxtw	x1, w0	
	mov	x0, x1	
	lsl	x0, x0, 2	
	add	x0, x0, x1	
	lsl	x0, x0, 2	
	add	x0, x0, x3	
	lsl	x0, x0, 2	
	add	x1, sp, 56	
	ldr	w0, [x1, x0]	
	mul	w2, w2, w0	
	ldr	w0, [sp, 36]	
	add	w0, w0, 2	
	ldr	w3, [sp, 32]	
	uxtw	x1, w0	
	mov	x0, x1	
	lsl	x0, x0, 2	
	add	x0, x0, x1	
	lsl	x0, x0, 2	
	add	x0, x0, x3	
	lsl	x0, x0, 2	
	add	x1, sp, 56	
	ldr	w0, [x1, x0]	
	mul	w2, w2, w0	
	ldr	w0, [sp, 36]	
	add	w0, w0, 3	
	ldr	w3, [sp, 32]	
	uxtw	x1, w0	
	mov	x0, x1	
	lsl	x0, x0, 2	
	add	x0, x0, x1	
	lsl	x0, x0, 2	
	add	x0, x0, x3	
	lsl	x0, x0, 2	
	add	x1, sp, 56	
	ldr	w0, [x1, x0]	
	mul	w0, w2, w0	
	str	w0, [sp, 44]	
	ldr	w2, [sp, 36]	
	ldr	w1, [sp, 32]	
	mov	x0, x1	
	lsl	x0, x0, 2	
	add	x0, x0, x1	
	lsl	x0, x0, 2	
	add	x0, x0, x2	
	lsl	x0, x0, 2	
	add	x1, sp, 56	
	ldr	w2, [x1, x0]	
	ldr	w0, [sp, 32]	
	add	w1, w0, 1	
	ldr	w0, [sp, 36]	
	add	w0, w0, 1	
	uxtw	x3, w0	
	uxtw	x1, w1	
	mov	x0, x1	
	lsl	x0, x0, 2	
	add	x0, x0, x1	
	lsl	x0, x0, 2	
	add	x0, x0, x3	
	lsl	x0, x0, 2	
	add	x1, sp, 56	
	ldr	w0, [x1, x0]	
	mul	w2, w2, w0	
	ldr	w0, [sp, 32]	
	add	w1, w0, 2	
	ldr	w0, [sp, 36]	
	add	w0, w0, 2	
	uxtw	x3, w0	
	uxtw	x1, w1	
	mov	x0, x1	
	lsl	x0, x0, 2	
	add	x0, x0, x1	
	lsl	x0, x0, 2	
	add	x0, x0, x3	
	lsl	x0, x0, 2	
	add	x1, sp, 56	
	ldr	w0, [x1, x0]	
	mul	w2, w2, w0	
	ldr	w0, [sp, 32]	
	add	w1, w0, 3	
	ldr	w0, [sp, 36]	
	add	w0, w0, 3	
	uxtw	x3, w0	
	uxtw	x1, w1	
	mov	x0, x1	
	lsl	x0, x0, 2	
	add	x0, x0, x1	
	lsl	x0, x0, 2	
	add	x0, x0, x3	
	lsl	x0, x0, 2	
	add	x1, sp, 56	
	ldr	w0, [x1, x0]	
	mul	w0, w2, w0	
	str	w0, [sp, 48]	
	mov	w1, 19	
	ldr	w0, [sp, 36]	
	sub	w0, w1, w0	
	uxtw	x2, w0	
	ldr	w1, [sp, 32]	
	mov	x0, x1	
	lsl	x0, x0, 2	
	add	x0, x0, x1	
	lsl	x0, x0, 2	
	add	x0, x0, x2	
	lsl	x0, x0, 2	
	add	x1, sp, 56	
	ldr	w2, [x1, x0]	
	ldr	w0, [sp, 32]	
	add	w4, w0, 1	
	mov	w1, 18	
	ldr	w0, [sp, 36]	
	sub	w0, w1, w0	
	uxtw	x3, w0	
	uxtw	x1, w4	
	mov	x0, x1	
	lsl	x0, x0, 2	
	add	x0, x0, x1	
	lsl	x0, x0, 2	
	add	x0, x0, x3	
	lsl	x0, x0, 2	
	add	x1, sp, 56	
	ldr	w0, [x1, x0]	
	mul	w2, w2, w0	
	ldr	w0, [sp, 32]	
	add	w4, w0, 2	
	mov	w1, 17	
	ldr	w0, [sp, 36]	
	sub	w0, w1, w0	
	uxtw	x3, w0	
	uxtw	x1, w4	
	mov	x0, x1	
	lsl	x0, x0, 2	
	add	x0, x0, x1	
	lsl	x0, x0, 2	
	add	x0, x0, x3	
	lsl	x0, x0, 2	
	add	x1, sp, 56	
	ldr	w0, [x1, x0]	
	mul	w2, w2, w0	
	ldr	w0, [sp, 32]	
	add	w4, w0, 3	
	mov	w1, 16	
	ldr	w0, [sp, 36]	
	sub	w0, w1, w0	
	uxtw	x3, w0	
	uxtw	x1, w4	
	mov	x0, x1	
	lsl	x0, x0, 2	
	add	x0, x0, x1	
	lsl	x0, x0, 2	
	add	x0, x0, x3	
	lsl	x0, x0, 2	
	add	x1, sp, 56	
	ldr	w0, [x1, x0]	
	mul	w0, w2, w0	
	str	w0, [sp, 52]	
	ldr	w1, [sp, 52]	
	ldr	w0, [sp, 48]	
	bl	max		
	mov	w1, w0	
	ldr	w0, [sp, 44]	
	bl	max		
	mov	w1, w0	
	ldr	w0, [sp, 40]	
	bl	max		
	mov	w1, w0	
	ldr	w0, [sp, 28]	
	bl	max		
	str	w0, [sp, 28]	
	ldr	w0, [sp, 36]	
	add	w0, w0, 1	
	str	w0, [sp, 36]	
.L3:
	ldr	w0, [sp, 36]	
	cmp	w0, 16	
	bls	.L4		
	ldr	w0, [sp, 32]	
	add	w0, w0, 1	
	str	w0, [sp, 32]	
.L2:
	ldr	w0, [sp, 32]	
	cmp	w0, 16	
	bls	.L5		
	ldr	w1, [sp, 28]	
	adrp	x0, .LC1	
	add	x0, x0, :lo12:.LC1	
	bl	printf		
	mov	w0, 0	
	mov	w1, w0	
	adrp	x0, :got:__stack_chk_guard	
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]	
	ldr	x3, [sp, 1656]	
	ldr	x2, [x0]	
	subs	x3, x3, x2	
	mov	x2, 0	
	beq	.L7		
	bl	__stack_chk_fail		
.L7:
	mov	w0, w1	
	ldp	x29, x30, [sp]	
	add	sp, sp, 1664	
	.cfi_restore 29
	.cfi_restore 30
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.rodata
	.align	3
.LC0:
	.word	8
	.word	2
	.word	22
	.word	97
	.word	38
	.word	15
	.word	0
	.word	40
	.word	0
	.word	75
	.word	4
	.word	5
	.word	7
	.word	78
	.word	52
	.word	12
	.word	50
	.word	77
	.word	91
	.word	8
	.word	49
	.word	49
	.word	99
	.word	40
	.word	17
	.word	81
	.word	18
	.word	57
	.word	60
	.word	87
	.word	17
	.word	40
	.word	98
	.word	43
	.word	69
	.word	48
	.word	4
	.word	56
	.word	62
	.word	0
	.word	81
	.word	49
	.word	31
	.word	73
	.word	55
	.word	79
	.word	14
	.word	29
	.word	93
	.word	71
	.word	40
	.word	67
	.word	53
	.word	88
	.word	30
	.word	3
	.word	49
	.word	13
	.word	36
	.word	65
	.word	52
	.word	70
	.word	95
	.word	23
	.word	4
	.word	60
	.word	11
	.word	42
	.word	69
	.word	24
	.word	68
	.word	56
	.word	1
	.word	32
	.word	56
	.word	71
	.word	37
	.word	2
	.word	36
	.word	91
	.word	22
	.word	31
	.word	16
	.word	71
	.word	51
	.word	67
	.word	63
	.word	89
	.word	41
	.word	92
	.word	36
	.word	54
	.word	22
	.word	40
	.word	40
	.word	28
	.word	66
	.word	33
	.word	13
	.word	80
	.word	24
	.word	47
	.word	32
	.word	60
	.word	99
	.word	3
	.word	45
	.word	2
	.word	44
	.word	75
	.word	33
	.word	53
	.word	78
	.word	36
	.word	84
	.word	20
	.word	35
	.word	17
	.word	12
	.word	50
	.word	32
	.word	98
	.word	81
	.word	28
	.word	64
	.word	23
	.word	67
	.word	10
	.word	26
	.word	38
	.word	40
	.word	67
	.word	59
	.word	54
	.word	70
	.word	66
	.word	18
	.word	38
	.word	64
	.word	70
	.word	67
	.word	26
	.word	20
	.word	68
	.word	2
	.word	62
	.word	12
	.word	20
	.word	95
	.word	63
	.word	94
	.word	39
	.word	63
	.word	8
	.word	40
	.word	91
	.word	66
	.word	49
	.word	94
	.word	21
	.word	24
	.word	55
	.word	58
	.word	5
	.word	66
	.word	73
	.word	99
	.word	26
	.word	97
	.word	17
	.word	78
	.word	78
	.word	96
	.word	83
	.word	14
	.word	88
	.word	34
	.word	89
	.word	63
	.word	72
	.word	21
	.word	36
	.word	23
	.word	9
	.word	75
	.word	0
	.word	76
	.word	44
	.word	20
	.word	45
	.word	35
	.word	14
	.word	0
	.word	61
	.word	33
	.word	97
	.word	34
	.word	31
	.word	33
	.word	95
	.word	78
	.word	17
	.word	53
	.word	28
	.word	22
	.word	75
	.word	31
	.word	67
	.word	15
	.word	94
	.word	3
	.word	80
	.word	4
	.word	62
	.word	16
	.word	14
	.word	9
	.word	53
	.word	56
	.word	92
	.word	16
	.word	39
	.word	5
	.word	42
	.word	96
	.word	35
	.word	31
	.word	47
	.word	55
	.word	58
	.word	88
	.word	24
	.word	0
	.word	17
	.word	54
	.word	24
	.word	36
	.word	29
	.word	85
	.word	57
	.word	86
	.word	56
	.word	0
	.word	48
	.word	35
	.word	71
	.word	89
	.word	7
	.word	5
	.word	44
	.word	44
	.word	37
	.word	44
	.word	60
	.word	21
	.word	58
	.word	51
	.word	54
	.word	17
	.word	58
	.word	19
	.word	80
	.word	81
	.word	68
	.word	5
	.word	94
	.word	47
	.word	69
	.word	28
	.word	73
	.word	92
	.word	13
	.word	86
	.word	52
	.word	17
	.word	77
	.word	4
	.word	89
	.word	55
	.word	40
	.word	4
	.word	52
	.word	8
	.word	83
	.word	97
	.word	35
	.word	99
	.word	16
	.word	7
	.word	97
	.word	57
	.word	32
	.word	16
	.word	26
	.word	26
	.word	79
	.word	33
	.word	27
	.word	98
	.word	66
	.word	88
	.word	36
	.word	68
	.word	87
	.word	57
	.word	62
	.word	20
	.word	72
	.word	3
	.word	46
	.word	33
	.word	67
	.word	46
	.word	55
	.word	12
	.word	32
	.word	63
	.word	93
	.word	53
	.word	69
	.word	4
	.word	42
	.word	16
	.word	73
	.word	38
	.word	25
	.word	39
	.word	11
	.word	24
	.word	94
	.word	72
	.word	18
	.word	8
	.word	46
	.word	29
	.word	32
	.word	40
	.word	62
	.word	76
	.word	36
	.word	20
	.word	69
	.word	36
	.word	41
	.word	72
	.word	30
	.word	23
	.word	88
	.word	34
	.word	62
	.word	99
	.word	69
	.word	82
	.word	67
	.word	59
	.word	85
	.word	74
	.word	4
	.word	36
	.word	16
	.word	20
	.word	73
	.word	35
	.word	29
	.word	78
	.word	31
	.word	90
	.word	1
	.word	74
	.word	31
	.word	49
	.word	71
	.word	48
	.word	86
	.word	81
	.word	16
	.word	23
	.word	57
	.word	5
	.word	54
	.word	1
	.word	70
	.word	54
	.word	71
	.word	83
	.word	51
	.word	54
	.word	69
	.word	16
	.word	92
	.word	33
	.word	48
	.word	61
	.word	43
	.word	52
	.word	1
	.word	89
	.word	19
	.word	67
	.word	48
	.text
	.align	2
	.type	max, %function
max:
.LFB1:
	.cfi_startproc
	sub	sp, sp, #16	
	.cfi_def_cfa_offset 16
	str	w0, [sp, 12]	
	str	w1, [sp, 8]	
	ldr	w0, [sp, 12]	
	ldr	w2, [sp, 8]	
	ldr	w1, [sp, 8]	
	cmp	w2, w0	
	csel	w0, w1, w0, cs	
	add	sp, sp, 16	
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE1:
	.size	max, .-max
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
