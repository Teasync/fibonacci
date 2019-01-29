.globl
.text
main:
    li a0, 20  # nth fib num
    jal ra, fib1
    li a0, 17
    ecall


fib1:
    addi sp, sp, -4
    sw ra, 0(sp)
    li a1, 2
    li a2, 1
    li a3, 1
    jal ra, fib2
    mv a1, a3
    lw ra, 0(sp)
    addi sp, sp, 4
    jalr zero, 0(ra)


fib2:
    addi sp, sp, -4
    sw ra, 0(sp)
    add t0, a2, a3
    mv a2, a3
    mv a3, t0
    mv t1, a0
    mv t2, a1
    mv a1, a3
    li a0, 1
    ecall
    li a0, 11
    li a1, 32
    ecall
    mv a0, t1
    mv a1, t2
    addi a1, a1, 1
    bne a0, a1, fib2
    lw ra, 0(sp)
    addi sp, sp, 4
    jalr zero 0(ra)
