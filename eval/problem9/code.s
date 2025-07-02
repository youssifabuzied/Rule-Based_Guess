.section .text
.global func0
.align 2

func0:
    cmp     w1, #1
    blt     LBB0_3

    mov     w8, w1
    cmp     w1, #16
    bhs     LBB0_4

LBB0_2:
    mov     x9, #0
    mov     w11, #0
    mov     w10, #1
    b       LBB0_7

LBB0_3:
    mov     w11, #0
    mov     w10, #1
    b       LBB0_9

LBB0_4:
    movi    v0.2d, #0
    and     x9, x8, #0xfffffff0
    movi    v4.4s, #1
    add     x10, x0, #32
    movi    v1.2d, #0
    mov     x11, x9
    movi    v2.2d, #0
    movi    v3.2d, #0
    movi    v5.2d, #0
    movi    v6.2d, #0
    movi    v7.2d, #0

LBB0_5:
    ldp     q16, q17, [x10, #-32]
    ldp     q18, q19, [x10], #64
    add     v0.4s, v16.4s, v0.4s
    add     v1.4s, v17.4s, v1.4s
    add     v2.4s, v18.4s, v2.4s
    add     v3.4s, v19.4s, v3.4s
    mul     v4.4s, v16.4s, v4.4s
    mul     v5.4s, v17.4s, v5.4s
    mul     v6.4s, v18.4s, v6.4s
    mul     v7.4s, v19.4s, v7.4s
    subs    x11, x11, #16
    bne     LBB0_5

LBB0_6:
    add     v4.4s, v4.4s, v5.4s
    add     v4.4s, v4.4s, v6.4s
    add     v4.4s, v4.4s, v7.4s
    addv    s4, v4.4s
    fmov    w11, s4

    mul     v0.4s, v0.4s, v1.4s
    mul     v0.4s, v0.4s, v2.4s
    mul     v0.4s, v0.4s, v3.4s

    ext     v1.16b, v0.16b, v0.16b, #2
    mul     v0.2s, v0.2s, v1.2s

    mov     w12, v0.s[1]
    fmov    w13, s0
    mul     w10, w13, w12

    cmp     x9, x8
    beq     LBB0_9

LBB0_7:
    add     x12, x0, x9, lsl #2
    sub     x8, x8, x9

LBB0_8:
    ldr     w9, [x12], #4
    add     w11, w9, w11
    mul     w10, w9, w10
    subs    x8, x8, #1
    bne     LBB0_8

LBB0_9:
    stp     w11, w10, [x2]
    ret
