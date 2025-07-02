.section .text
.global func0
.align 2

func0:
    sub     sp, sp, #48
    stp     x29, x30, [sp, #32]
    add     x29, sp, #32
    stur    x0, [x29, #-8]
    stur    wzr, [x29, #-12]
    ldur    x0, [x29, #-8]
    bl      strlen
    mov     x8, x0
    str     w8, [sp, #16]
    str     wzr, [sp, #12]
    b       LBB0_1

LBB0_1:
    ldr     w8, [sp, #12]
    ldr     w9, [sp, #16]
    subs    w8, w8, w9
    cset    w8, ge
    tbnz    w8, #0, LBB0_12
    b       LBB0_2

LBB0_2:
    ldur    x8, [x29, #-8]
    ldrsw   x9, [sp, #12]
    ldrb    w0, [x8, x9]
    bl      isalpha
    subs    w8, w0, #0
    cset    w8, eq
    tbnz    w8, #0, LBB0_9
    b       LBB0_3

LBB0_3:
    ldur    x8, [x29, #-8]
    ldrsw   x9, [sp, #12]
    ldrb    w0, [x8, x9]
    bl      isupper
    subs    w8, w0, #0
    cset    w8, eq
    tbnz    w8, #0, LBB0_5
    b       LBB0_4

LBB0_4:
    ldur    x8, [x29, #-8]
    ldrsw   x9, [sp, #12]
    ldrb    w0, [x8, x9]
    bl      tolower
    ldur    x8, [x29, #-8]
    ldrsw   x9, [sp, #12]
    strb    w0, [x8, x9]
    b       LBB0_8

LBB0_5:
    ldur    x8, [x29, #-8]
    ldrsw   x9, [sp, #12]
    ldrb    w0, [x8, x9]
    bl      islower
    subs    w8, w0, #0
    cset    w8, eq
    tbnz    w8, #0, LBB0_7
    b       LBB0_6

LBB0_6:
    ldur    x8, [x29, #-8]
    ldrsw   x9, [sp, #12]
    ldrb    w0, [x8, x9]
    bl      toupper
    ldur    x8, [x29, #-8]
    ldrsw   x9, [sp, #12]
    strb    w0, [x8, x9]

LBB0_7:
    b       LBB0_8

LBB0_8:
    b       LBB0_10

LBB0_9:
    ldur    w8, [x29, #-12]
    add     w8, w8, #1
    stur    w8, [x29, #-12]

LBB0_10:
    b       LBB0_11

LBB0_11:
    ldr     w8, [sp, #12]
    add     w8, w8, #1
    str     w8, [sp, #12]
    b       LBB0_1

LBB0_12:
    ldur    w8, [x29, #-12]
    ldr     w9, [sp, #16]
    subs    w8, w8, w9
    cset    w8, ne
    tbnz    w8, #0, LBB0_18
    b       LBB0_13

LBB0_13:
    str     wzr, [sp, #8]
    b       LBB0_14

LBB0_14:
    ldr     w8, [sp, #8]
    ldr     w9, [sp, #16]
    mov     w10, #2
    sdiv    w9, w9, w10
    subs    w8, w8, w9
    cset    w8, ge
    tbnz    w8, #0, LBB0_17
    b       LBB0_15

LBB0_15:
    ldur    x8, [x29, #-8]
    ldrsw   x9, [sp, #8]
    add     x8, x8, x9
    ldrb    w8, [x8]
    strb    w8, [sp, #7]

    ldur    x8, [x29, #-8]
    ldr     w9, [sp, #16]
    ldr     w10, [sp, #8]
    subs    w9, w9, w10
    subs    w9, w9, #1
    add     x8, x8, w9, sxtw
    ldrb    w8, [x8]
    ldur    x9, [x29, #-8]
    ldrsw   x10, [sp, #8]
    add     x9, x9, x10
    strb    w8, [x9]

    ldrb    w8, [sp, #7]
    ldur    x9, [x29, #-8]
    ldr     w10, [sp, #16]
    ldr     w11, [sp, #8]
    subs    w10, w10, w11
    subs    w10, w10, #1
    add     x9, x9, w10, sxtw
    strb    w8, [x9]
    b       LBB0_16

LBB0_16:
    ldr     w8, [sp, #8]
    add     w8, w8, #1
    str     w8, [sp, #8]
    b       LBB0_14

LBB0_17:
    b       LBB0_18

LBB0_18:
    ldur    x0, [x29, #-8]
    ldp     x29, x30, [sp, #32]
    add     sp, sp, #48
    ret
