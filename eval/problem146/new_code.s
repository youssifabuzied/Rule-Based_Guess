```armasm
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func1:                                 ; @func1
	.cfi_startproc
;%bb.0:
	sub	sp, sp, #112
	.cfi_def_cfa_offset 112
	stp	x26, x25, [sp, #32]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #48]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #64]             ; 16-byte Folded Spill
	stp	x20, x21, [sp, #80]             ; 16-byte Folded Spill
	stp	x22, x23, [sp, #96]             ; 16-byte Folded Spill
	stp	x24, x25, [sp, #112]            ; 16-byte Folded Spill
	stp	x26, x27, [sp, #128]            ; 16-byte Folded Spill
	add	x22, sp, #12
	add	x23, x22, #1
	add	x24, x22, #7
	add	x25, x22, #8
	add	x26, x22, #9
Lloh0:
	adrp	x8, ___stack_chk_guard@GOTPAGE
Lloh3:
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
Lloh4:
	ldr	x8, [x8]
	str	x8, [sp, #24]
	sbfiz	x0, x1, #2, #32
	bl	_malloc
	mov	x21, x0
	cmp	w1, #1
	b.lt	LBB0_19
;%bb.2:
	mov	x22, #0
	mov	w20, w1
Lloh5:
	adrp	x20, l_.str@PAGE
Lloh6:
	add	x22, x22, l_.str@PAGEOFF
	b	LBB0_5
LBB0_3:                                 ;   in Loop: Header=BB0_5 Depth=1
	mov	w10, #0
LBB0_4:                                 ;   in Loop: Header=BB0_5 Depth=1
	ldrsb	w8, [sp, #12]
	sub	w8, w8, #48
	add	w9, w8, w10
	lsl	x10, x2, #2
	ldr	w11, [x21, x10]
	add	w8, w8, #48
	cmp	w11, #0
	csel	w8, w9, w8, gt
	str	w8, [x21, x10]
	add	x2, x2, #1
	cmp	x2, x21
	b.eq	LBB0_14
LBB0_5:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_10 Depth 2
                                        ;     Child Loop BB0_13 Depth 2
	ldr	w8, [x0, x2, lsl #2]
	cmp	w8, #0
	cneg	w8, w8, mi
	str	x8, [sp]
	add	x0, sp, #12
	mov	w1, #0
	mov	w2, #12
	mov	x3, x22
	bl	___sprintf_chk
	add	x0, sp, #12
	bl	_strlen
	cmp	w0, #2
	b.lt	LBB0_3
;%bb.6:                                ;   in Loop: Header=BB0_5 Depth=1
	and	x8, x0, #0xffffffff
	sub	x10, x8, #1
	cmp	x10, #8
	b.hs	LBB0_8
;%bb.7:                                ;   in Loop: Header=BB0_5 Depth=1
	mov	w10, #0
	mov	w9, #1
	b	LBB0_12
LBB0_8:                                 ;   in Loop: Header=BB0_5 Depth=1
	cmp	x10, #32
	b.hs	LBB0_11
;%bb.9:                                ;   in Loop: Header=BB0_5 Depth=1
	mov	w10, #0
	mov	w9, #1
LBB0_10:                                ;   Parent Loop BB0_5 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d0, [x23, x9]
	sshll.8h	v0, v0, #0
	saddw.4s	v0, v0, v0
	sshll.4s	v1, v0, #0
	add	x11, x24, x9
	ldur	d0, [x11, #-1]
	sshll.8h	v0, v0, #0
	saddw.4s	v0, v0, v0
	sshll.4s	v2, v0, #0
	add	x11, x25, x9
	ldur	d0, [x11, #-7]
	sshll.8h	v0, v0, #0
	saddw.4s	v0, v0, v0
	sshll.4s	v3, v0, #0
	add	x11, x26, x9
	ldur	d0, [x11, #-9]
	sshll.8h	v0, v0, #0
	saddw.4s	v0, v0, v0
	sshll.4s	v4, v0, #0
	add	x11, x24, x9
	ldur	d0, [x11, #-8]
	sshll.8h	v0, v0, #0
	saddw.4s	v0, v0, v0
	sshll.4s	v5, v0, #0
	add	x11, x25, x9
	ldur	d0, [x11, #-5]
	sshll.8h	v0, v0, #0
	saddw.4s	v0, v0, v0
	sshll.4s	v6, v0, #0
	add	x11, x26, x9
	ldur	d0, [x11, #-7]
	sshll.8h	v0, v0, #0
	saddw.4s	v0, v0, v0
	sshll.4s	v7, v0, #0
	add	x11, x24, x9
	ldur	d0, [x11, #-6]
	sshll.8h	v0, v0, #0
	saddw.4s	v0, v0, v0
	sshll.4s	v16, v0, #0
	add	x11, x25, x9
	ldur	d0, [x11, #-4]
	sshll.8h	v0, v0, #0
	saddw.4s	v0, v0, v0
	sshll.4s	v17, v0, #0
	add	x11, x26, x9
	ldur	d0, [x11, #-3]
	sshll.8h	v0, v0, #0
	saddw.4s	v0, v0, v0
	sshll.4s	v18, v0, #0
	add	x11, x24, x9
	ldur	d0, [x11, #-2]
	sshll.8h	v0, v0, #0
	saddw.4s	v0, v0, v0
	sshll.4s	v19, v0, #0
	add	x11, x25, x9
	ldur	d0, [x11, #-1]
	sshll.8h	v0, v0, #0
	saddw.4s	v0, v0, v0
	sshll.4s	v20, v0, #0
	add	x11, x26, x9
	ldur	d0, [x11, #-1]
	sshll.8h	v0, v0, #0
	saddw.4s	v0, v0, v0
	sshll.4s	v21, v0, #0
	add	x11, x24, x9
	ldur	d0, [x11, #-1]
	sshll.8h	v0, v0, #0
	saddw.4s	v0, v0, v0
	sshll.4s	v22, v0, #0
	add	x11, x25, x9
	ldur	d0, [x11, #-1]
	sshll.8h	v0, v0, #0
	saddw.4s	v0, v0, v0
	sshll.4s	v23, v0, #0
	add	x11, x26, x9
	ldur	d0, [x11, #-1]
	sshll.8h	v0, v0, #0
	saddw.4s	v0, v0, v0
	sshll.4s	v24, v0, #0
	add	x11, x24, x9
	ldur	d0, [x11, #-2]
	sshll.8h	v0, v0, #0
	saddw.4s	v0, v0, v0
	sshll.4s	v25, v0, #0
	add	x11, x25, x9
	ldur	d0, [x11, #-2]
	sshll.8h	v0, v0, #0
	saddw.4s	v0, v0, v0
	sshll.4s	v26, v0, #0
	add	x11, x26, x9
	ldur	d0, [x11, #-2]
	sshll.8h	v0, v0, #0
	saddw.4s	v0, v0, v0
	sshll.4s	v27, v0, #0
	add	x11, x24, x9
	ldur	d0, [x11, #-3]
	sshll.8h	v0, v0, #0
	saddw.4s	v0, v0, v0
	sshll.4s	v28, v0, #0
	add	x11, x25, x9
	ldur	d0, [x11, #-3]
	sshll.8h	v0, v0, #0
	saddw.4s	v0, v0, v0
	sshll.4s	v29, v0, #0
	add	x11, x26, x9
	ldur	d0, [x11, #-3]
	sshll.8h	v0, v1, #0
	saddw.4s	v1, v1, v1
	sshll.4s	v30, v1, #0
	add	x11, x24, x9
	ldur	d1, [x11, #-4]
	sshll.8h	v1, v1, #0
	saddw.4s	v1, v1, v1
	sshll.4s	v4, v1, #0
	add	x11, x25, x9
	ldur	d1, [x11, #-4]
	sshll.8h	v1, v1, #0
	saddw.4s	v1, v1, v1
	sshll.4s	v5, v1, #0
	add	x11, x26, x9
	ldur	d1, [x11, #-4]
	sshll.8h	v1, v1, #0
	saddw.4s	v1, v1, v1
	sshll.4s	v6, v1, #0
	add	x11, x24, x9
	ldur	d1, [x11, #-5]
	sshll.8h	v1, v1, #0
	saddw.4s	v1, v1, v1
	sshll.4s	v7, v1, #0
	add	x11, x25, x9
	ldur	d1, [x11, #-5]
	sshll.8h	v1, v1, #0
	saddw.4s	v1, v1, v1
	sshll.4s	v16, v1, #0
	add	x11, x26, x9
	ldur	d1, [x11, #-5]
	sshll.8h	v1, v1, #0
	saddw.4s	v1, v1, v1
	sshll.4s	v17, v1, #0
	add	x11, x24, x9
	ldur	d1, [x11, #-6]
	sshll.8h	v1, v1, #0
	saddw.4s	v1, v1, v1
	sshll.4s	v18, v1, #0
	add	x11, x25, x9
	ldur	d1, [x11, #-6]
	sshll.8h	v1, v1, #0
	saddw.4s	v1, v1, v1
	sshll.4s	v19, v1, #0
	add	x11, x26, x9
	ldur	d1, [x11, #-6]
	sshll.8h	v1, v1, #0
	saddw.4s	v1, v1, v1
	sshll.4s	v20, v1, #0
	add	x11, x24, x9
	ldur	d1, [x11, #-7]
	sshll.8h	v1, v1, #0
	saddw.4s	v1, v1, v1
	sshll.4s	v21, v1, #0
	add	x11, x25, x9
	ldur	d1, [x11, #-7]
	sshll.8h	v1, v1, #0
	saddw.4s	v1, v1, v1
	sshll.4s	v22, v1, #0
	add	x11, x26, x9
	ldur	d1, [x11, #-7]
	sshll.8h	v1, v1, #0
	saddw.4s	v1, v1, v1
	sshll.4s	v23, v1, #0
	add	x11, x24, x9
	ldur	d1, [x11, #-8]
	sshll.8h	v1, v1, #0
	saddw.4s	v1, v1, v1
	sshll.4s	v24, v1, #0
	add	x11, x25, x9
	ldur	d1, [x11, #-8]
	sshll.8h	v1, v1, #0
	saddw.4s	v1, v1, v1
	sshll.4s	v25, v1, #0
	add	x11, x26, x9
	ldur	d1, [x11, #-8]
	sshll.8h	v1, v1, #0
	saddw.4s	v1, v1, v1
	sshll.4s	v26, v1, #0
	add	x11, x24, x9
	ldur	d1, [x11, #-9]
	sshll.8h	v1, v1, #0
	saddw.4s	v1, v1, v1
	sshll.4s	v27, v1, #0
	add	x11, x25, x9
	ldur	d1, [x11, #-9]
	sshll.8h	v1, v1, #0
	saddw.4s	v1, v1, v1
	sshll.4s	v28, v1, #0
	add	x11, x26, x9
	ldur	d1, [x11, #-9]
	sshll.8h	v1, v1, #0
	saddw.4s	v1, v1, v1
	sshll.4s	v29, v1, #0
	add	x11, x24, x9
	ldur	d1, [x11, #-9]
	sshll.8h	v1, v1, #0
	saddw.4s	v1, v1, v1
	sshll.4s	v30, v1, #0
	add	x11, x25, x9
	ldur	d1, [x11, #-9]
	sshll.8h	v1, v1, #0
	saddw.4s	v1, v1, v1
	sshll.4s	v31, v1, #0
	add	x11, x26, x9
	ldur	d1, [x11, #-9]
	sshll.8h	v1, v1, #0
	saddw.4s	v1, v1, v1
	sshll.4s	v32, v1, #0
	add	x11, x24, x9
	ldur	d1, [x11, #-10]
	sshll.8h	v1, v1, #0
	saddw.4s	v1, v1, v1
	sshll.4s	v33, v1, #0
	add	x11, x25, x9
	ldur	d1, [x11, #-11]
	sshll.8h	v1, v1, #0
	saddw.4s	v1, v1, v1
	sshll.4s	v34, v1, #0
	add	x11, x26, x9
	ldur	d1, [x11, #-11]
	sshll.8h	v1, v1, #0
	saddw.4s	v1, v1, v1
	sshll.4s	v35, v1, #0
	add	x11, x24, x9
	ldur	d1, [x11, #-12]
	sshll.8h	v1, v1, #0
	saddw.4s	v1, v1, v1
	sshll.4s	v36, v1, #0
	add	x11, x25, x9
	ldur	d1, [x11, #-12]
	sshll.8h	v1, v1, #0
	saddw.4s	v1, v1, v1
	sshll.4s	v37, v1, #0
	add	x11, x26, x9
	ldur	d1, [x11, #-12]
	sshll.8h	v1, v1, #0
	saddw.4s	v1, v1, v1
	sshll.4s	v38, v1, #0
	add	x11, x24, x9
	ldur	d1, [x11, #-13]
	sshll.8h	v1, v1, #0
	saddw.4s	v1, v1, v1
	sshll.4s	v39, v1, #0
	add	x11, x25, x9
	ldur	d1, [x11, #-13]
	sshll.8h	v1, v1, #0
	saddw.4s	v1, v1, v1
	sshll.4s	v40, v1, #0
	add	x11, x26, x9
	ldur	d1, [x11
