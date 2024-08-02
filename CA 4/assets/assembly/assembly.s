    lw x8, 0(x0)
    addi x6, x0, 64
    addi x7, x7, 40
    beq x0, x7, label
    lw x8, 0(x6)
    add x9, x9, x8
    beq x8, x0, label
    add x8, x2, x0
    addi x6, x8, 12
    jal x0, label
    lui x10, 0x35
    jal x11, 32

label:
    nop
