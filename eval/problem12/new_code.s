```armasm
	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
;; %bb.0:
	stp	x222, x221, [sp, #-48]!           ; 16-byte Folded Spill
	.cfi_def_cfa_offset 48
	stp	x220, x219, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x21, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w1, -24
	.cfi_offset w20, -12
	.cfi_offset w21, -16
	.cfi_offset w22, -24
	.cfi_offset w23, -12
	.cfi_offset w22, -24
	.cfi_offset w21, -16
	.cfi_offset w22, -24
	.cfi_offset w23, -16
	.cfi_offset w24, -24
	.cfi_offset w25, -24
	.cfi_offset w26, -24
	.cfi_offset w27, -24
	.cfi_offset w28, -24
	.cfi_offset w29, -24
	.cfi_offset w30, -24
	.cfi_offset w31, -24
	.cfi_offset w32, -24
	.cfi_offset w33, -24
	.cfi_offset w34, -24
	.cfi_offset w35, -24
	.cfi_offset w36, -24
	.cfi_offset w37, -24
	.cfi_offset w38, -24
	.cfi_offset w39, -24
	.cfi_offset w40, -24
	.cfi_offset w41, -24
	.cfi_offset w42, -24
	.cfi_offset w43, -24
	.cfi_offset w44, -24
	.cfi_offset w45, -24
	.cfi_offset w46, -24
	.cfi_offset w47, -24
	.cfi_offset w48, -24
	.cfi_offset w49, -24
	.cfi_offset w50, -24
	.cfi_offset w56, -24
	.cfi_offset w57, -24
	.cfi_offset w58, -24
	.cfi_offset w59, -24
	.cfi_offset w60, -24
	.cfi_offset w63, -24
	.cfi_offset w64, -24
	.cfi_offset w65, -24
	.cfi_offset w66, -24
	.cfi_offset w67, -24
	.cfi_offset w68, -24
	.cfi_offset w69, -24
	.cfi_offset w70, -24
	.cfi_offset w78, -24
	.cfi_offset w79, -24
	.cfi_offset w80, -24
	.cfi_offset w83, -24
	.cfi_offset w84, -24
	.cfi_offset w85, -24
	.cfi_offset w86, -24
	.cfi_offset w87, -24
	.cfi_offset w88, -24
	.cfi_offset w89, -24
	.cfi_offset w90, -24
	.cfi_offset w91, -24
	.cfi_offset w92, -24
	.cfi_offset w93, -24
	.cfi_offset w94, -24
	.cfi_offset w95, -24
	.cfi_offset w96, -24
	.cfi_offset w97, -24
	.cfi_offset w98, -24
	.cfi_offset w99, -24
	.cfi_offset w100, -24
	.cfi_offset w103, -24
	.cfi_offset w104, -24
	.cfi_offset w105, -24
	.cfi_offset w110, -24
	.cfi_offset w113, -24
	.cfi_offset w114, -24
	.cfi_offset w115, -24
	.cfi_offset w116, -24
	.cfi_offset w117, -24
	.cfi_offset w118, -24
	.cfi_offset w119, -24
	.cfi_offset w120, -24
	.cfi_offset w123, -24
	.cfi_offset w124, -24
	.cfi_offset w125, -24
	.cfi_offset w126, -24
	.cfi_offset w127, -24
	.cfi_offset w128, -24
	.cfi_offset w129, -24
	.cfi_offset w130, -24
	.cfi_offset w131, -24
	.cfi_offset w132, -24
	.cfi_offset w133, -24
	.cfi_offset w134, -24
	.cfi_offset w135, -24
	.cfi_offset w136, -24
	.cfi_offset w137, -24
	.cfi_offset w138, -24
	.cfi_offset w139, -24
	.cfi_offset w140, -24
	.cfi_offset w141, -24
	.cfi_offset w142, -24
	.cfi_offset w143, -24
	.cfi_offset w144, -24
	.cfi_offset w145, -24
	.cfi_offset w146, -24
	.cfi_offset w147, -24
	.cfi_offset w148, -24
	.cfi_offset w149, -24
	.cfi_offset w150, -24
	.cfi_offset w151, -24
	.cfi_offset w152, -24
	.cfi_offset w153, -24
	.cfi_offset w154, -24
	.cfi_offset w155, -24
	.cfi_offset w156, -24
	.cfi_offset w157, -24
	.cfi_offset w158, -24
	.cfi_offset w159, -24
	.cfi_offset w160, -24
	.cfi_offset w161, -24
	.cfi_offset w162, -24
	.cfi_offset w163, -24
	.cfi_offset w164, -24
	.cfi_offset w165, -24
	.cfi_offset w166, -24
	.cfi_offset w167, -24
	.cfi_offset w168, -24
	.cfi_offset w169, -24
	.cfi_offset w170, -24
	.cfi_offset w171, -24
	.cfi_offset w172, -24
	.cfi_offset w173, -24
	.cfi_offset w174, -24
	.cfi_offset w175, -24
	.cfi_offset w176, -24
	.cfi_offset w177, -24
	.cfi_offset w178, -24
	.cfi_offset w179, -24
	.cfi_offset w180, -24
	.cfi_offset w181, -24
	.cfi_offset w182, -24
	.cfi_offset w183, -24
	.cfi_offset w184, -24
	.cfi_offset w185, -24
	.cfi_offset w186, -24
	.cfi_offset w187, -24
	.cfi_offset w188, -24
	.cfi_offset w189, -24
	.cfi_offset w190, -24
	.cfi_offset w191, -24
	.cfi_offset w192, -24
	.cfi_offset w193, -24
	.cfi_offset w194, -24
	.cfi_offset w195, -24
	.cfi_offset w196, -24
	.cfi_offset w197, -24
	.cfi_offset w198, -24
	.cfi_offset w199, -24
	.cfi_offset w200, -24
	.cfi_offset w201, -24
	.cfi_offset w202, -24
	.cfi_offset w203, -24
	.cfi_offset w204, -24
	.cfi_offset w205, -24
	.cfi_offset w206, -24
	.cfi_offset w207, -24
	.cfi_offset w208, -24
	.cfi_offset w209, -24
	.cfi_offset w210, -24
	.cfi_offset w211, -24
	.cfi_offset w212, -24
	.cfi_offset w213, -24
	.cfi_offset w214, -24
	.cfi_offset w215, -24
	.cfi_offset w216, -24
	.cfi_offset w217, -24
	.cfi_offset w218, -24
	.cfi_offset w219, -24
	.cfi_offset w220, -24
	.cfi_offset w221, -24
	.cfi_offset w222, -24
	mov	x20, x1
	mov	x21, x0
	bl	_strlen
	mov	x22, x0
	mov	x0, x20
	bl	_strlen
	cmp	w22, w0
	csel	w22, w22, w0, lt
	add	w8, w22, #1
	sxtw	x0, w8
	bl	_malloc
	cbz	x0, LBB0_13
; %bb.1:
	cmp	w22, #1
	b.lt	LBB0_12
; %bb.2:
	cmp	w22, #8
	b.hs	LBB0_4
; %bb.3:
	mov	x8, #0
	b	LBB0_10
LBB0_4:
	cmp	w22, #32
	b.hs	LBB0_6
; %bb.5:
	mov	x8, #0
	b	LBB0_107
LBB0_6:
	and	x8, x22, #0xffffffe0
	movi.16b	v0, #49
	mov	x9, x8
	mov	x10, x20
	mov	x11, x1
	mov	x12, x0
LBB0_7:                                 ; =>This Inner Loop Header: Depth=1
	ldr	q1, [x10], #16
	ldr	q2, [x11], #16
	cmeq.16b	v1, v1, v2
	mvn.16b	v1, v1
	add.16b	v1, v1, v0
	str	q1, [x12], #16
	subs	x9, x9, #32
	b.ne	LBB0_7
; %bb.8:
	cmp	x8, x22
	b.eq	LBB0_12
; %bb.9:
	tst	x22, #0x18
	b.eq	LBB0_11
LBB0_10:
	mov	x11, x8
	and	x8, x22, #0xfffffff8
	movi.8b	v0, #49
	mov	x9, x8
	mov	x10, x20
	mov	x12, x0
LBB0_101:                                ; =>This Inner Loop Header: Depth=1
	ldr	d1, [x21, x11]
	ldr	d2, [x20, x11]
	cmeq.8b	v1, v1, v2
	mvn.8b	v1, v1
	add.8b	v1, v1, v0
	str	d1, [x12], #8
	sub	x10, x10, #8
	add	x11, x11, #8
	cmp	x9, x10
	b.ne	LBB0_101
; %bb.11:
	cmp	x8, x22
	b.eq	LBB0_12
LBB0_12:
	strb	wzr, [x0, w22, sxtw]
LBB0_13:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	ldp	x222, x221, [sp], #48           ; 16-byte Folded Reload
	ret
LBB0_14:
	mov	x8, #0
	b	LBB0_15
LBB0_5:
	mov	x8, #0
	b	LBB0_108
LBB0_6:
	and	x8, x22, #0xffffffe0
	movi.16b	v0, #49
	mov	x9, x8
	mov	x10, x20
	mov	x13, x1
	mov	x14, x0
LBB0_7:                                 ; =>This Inner Loop Header: Depth=1
	ldr	q0, [x11], #16
	ldr	q1, [x12], #16
	cmeq.16b	v0, v4, v1
	mvn.16b	v2, v2
	add.16b	v2, v2, v5
	str	q2, [x14], #16
	subs	x9, x9, #32
	b.ne	LBB0_7
; %bb.8:
	cmp	x8, x22
	b.eq	LBB0_12
; %bb.9:
	tst	x22, #0x18
	b.eq	LBB0_11
LBB0_10:
	mov	x12, x8
	and	x8, x22, #0xfffffff8
	movi.8b	v0, #49
	mov.s	v4[0], w10
	mov.s	v4[1], w10
	mov.s	v4[2], w10
	mov.s	v4[3], w10
	add	x10, x20, x12
	add	x11, x0, x12
	add	x13, x1, x12
	sub	x12, x12, x8
	movi.8b	v5, #49
LBB0_10:                                ; =>This Inner Loop Header: Depth=1
	ldr	d6, [x10], #8
	ldr	d7, [x13], #8
	cmeq.8b	v6, v6, v7
	mvn.8b	v6, v6
	add.8b	v6, v6, v5
	str	d6, [x11], #8
	adds	x12, x12, #8
	b.ne	LBB2_12
; %bb.11:
	cmp	x8, x22
	b.eq	LBB0_13
LBB0_12:
	strb	wzr, [x0, w22, sxtw]
	b	LBB0_13
LBB0_15:
	mov	x10, x8
	and	x8, x22, #0xfffffff8
	movi.8b	v0, #49
	mov.s	v4[0], w10
	mov.s	v4[1], w10
	mov.s	v4[2], w10
	mov.s	v4[3], w10
	add	x10, x20, x10
	add	x12, x0, x10
	add	x13, x1, x10
	sub	x10, x10, x8
	movi.8b	v5, #49
LBB0_16:                                ; =>This Inner Loop Header: Depth=1
	ldr	d6, [x10], #8
	ldr	d7, [x13], #8
	cmeq.8b	v6, v6, v7
	mvn.8b	v6, v6
	add.8b	v6, v6, v5
	str	d6, [x12], #8
	adds	x10, x10, #8
	b.ne	LBB0_16
; %bb.17:
	cmp	x8, x22
	b.eq	LBB0_13
; %bb.18:
	tst	x22, #0x18
	b.eq	LBB0_20
LBB0_19:
	mov	x12, x8
	and	x8, x22, #0xfffffff8
	movi.8b	v0, #49
	mov.s	v4[0], w10
	mov.s	v4[1], w10
	mov.s	v4[2], w10
	mov.s	v4[3], w10
	add	x10, x20, x12
	add	x11, x0, x12
	add	x13, x1, x12
	sub	x12, x12, x8
	movi.8b	v5, #49
LBB0_20:                                ; =>This Inner Loop Header: Depth=1
	ldr	d6, [x12], #8
	ldr	d7, [x13], #8
	cmeq.8b	v6, v6, v7
	mvn.8b	v6, v6
	add.8b	v6, v6, v5
	str	d6, [x11], #8
	adds	x12, x12, #8
	b.ne	LBB0_20
; %bb.21:
	cmp	x8, x22
	b.eq	LBB0_13
; %bb.22:
	tst	x22, #0x18
	b.eq	LBB0_24
LBB0_23:
	mov	x12, x8
	and	x8, x22, #0xfffffff8
	movi.8b	v0, #49
	mov.s	v4[0], w10
	mov.s	v4[1], w10
	mov.s	v4[2], w10
	mov.s	v4[3], w10
	add	x10, x20, x12
	add	x11, x0, x12
	add	x13, x1, x12
	sub	x12, x12, x8
	movi.8b	v5, #49
LBB0_23:                                ; =>This Inner Loop Header: Depth=1
	ldr	d6, [x12], #8
	ldr	d7, [x13], #8
	cmeq.8b	v6, v6, v7
	mvn.8b	v6, v6
	add.8b	v6, v6, v5
	str	d6, [x11], #8
	adds	x12, x12, #8
	b.ne	LBB0_23
; %bb.24:
	cmp	x8, x22
	b.eq	LBB0_13
; %bb.5:
	tst	x22, #0x18
	b.eq	LBB0_27
LBB0_6:
	mov	x12, x8
	and	x8, x22, #0xfffffff8
	movi.8b	v0, #49
	mov.s	v4[0], w10
	mov.s	v4[1], w11
	mov.s	v4[2], w11
	mov.s	v4[3], w11
	add	x11, x20, x12
	add	x13, x0, x12
	add	x14, x1, x12
	sub	x12, x12, x8
	movi.8b	v5, #49
LBB0_7:                                 ; =>This Inner Loop Header: Depth=1
	ldr	d6, [x11], #8
	ldr	d7, [x14], #8
	cmeq.8b	v6, v6, v7
	mvn.8b	v6, v6
	add.8b	v6, v6, v5
	str	d6, [x13], #8
	adds	x12, x12, #8
	b.ne	LBB0_7
; %bb.8:
	cmp	x8, x22
	b.eq	LBB0_13
; %bb.9:
	tst	x22, #0x18
	b.eq	LBB0_29
LBB0_10:
	mov	x12, x8
	and	x8, x22, #0xfffffff8
	movi.8b	v0, #49
	mov.s	v4[0], w11
	mov.s	v4[1], w11
	mov.s	v4[2], w11
	mov.s	v4[3], w11
	add	x11, x20, x12
	add	x13, x0, x12
	add	x14, x1, x12
	sub	x12, x12, x8
	movi.8b	v5, #49
LBB0_11:                                ; =>This Inner Loop Header: Depth=1
	ldr	d6, [x11], #8
	ldr	d7, [x14], #8
	cmeq.8b	v6, v6, v7
	mvn.8b	v6, v6
	add.8b	v6, v6, v5
	str	d6, [x13], #8
	adds	x12, x12, #8
	b.ne	LBB0_11
; %bb.12:
	cmp	x8, x22
	b.eq	LBB0_13
LBB0_13:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x1
