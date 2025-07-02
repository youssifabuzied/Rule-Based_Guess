.section .text
.global func0
.align 2

func0:
    stp     x20, x19, [sp, #-32]!
    stp     x29, x30, [sp, #16]
    add     x29, sp, #16

    cmp     w1, #1
    blt     LBB0_5

    mov     x20, x1
    mov     x19, x0
    mov     w20, w1
    lsl     x0, x20, #2
    bl      malloc
    cbz     x0, LBB0_6

    ldr     w8, [x19]
    str     w8, [x0]

    cmp     w20, #1
    beq     LBB0_6

    sub     x9, x20, #1
    add     x10, x0, #4
    add     x11, x19, #4

LBB0_4:
    ldr     w12, [x11], #4
    cmp     w12, w8
    csel    w8, w12, w8, gt
    str     w8, [x10], #4
    subs    x9, x9, #1
    bne     LBB0_4
    b       LBB0_6

LBB0_5:
    mov     x0, #0

LBB0_6:
    ldp     x29, x30, [sp, #16]
    ldp     x20, x19, [sp], #32
    ret
