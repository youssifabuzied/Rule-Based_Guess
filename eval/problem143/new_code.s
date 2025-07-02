```armasm
; -- Begin function func0
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	cmp	w1, #1
	b.lt	LBB0_6
; %bb.1:
	mov	x8, x0
	mov	w9, #0
	mov	w0, #0
	mov	w10, #43691
	movk	w10, #43690, lsl #16
	mov	w11, w1
	b	LBB0_4
LBB0_2:                                 ;   in Loop: Header=BB0_4 Depth=1
	ldr	w12, [x8]
	mul	w12, w12, w12
LBB0_3:                                 ;   in Loop: Header=BB0_4 Depth=1
	add	w0, w12, w0
	add	x8, x8, #4
	subs	x11, x11, #1
	b.eq	LBB0_7
LBB0_4:                                 ; =>This Inner Loop Header: Depth=1
	and	x12, x9, #0xffffffff
	mul	x12, x12, x10
	lsr	x12, x12, #33
	add	w12, w12, w12, lsl #1
	cmp	w9, w12
	b.eq	LBB0_2
; %bb.5:                                ;   in Loop: Header=BB0_4 Depth=1
	ldr	w12, [x8]
	tst	w9, #0x3
	mul	w13, w12, w12
	mul	w12, w13, w12
	csel	w12, w12, w13, ne
	b	LBB0_3
LBB0_6:
	mov	w0, #0
LBB0_7:
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
