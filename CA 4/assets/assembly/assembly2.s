lw x8, 0(x0)
addi x6, x0, 4
slti x7, x6, 40
beq x7, x0, 8
lw x9, 0(x6)
add x1, x8, x9
beq x0, x0, 0
add x8, x0, x9
addi x6, x6, 4
jal x1, -0x10
