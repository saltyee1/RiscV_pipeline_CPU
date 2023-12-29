/**
 * This file contains a basic assembly program for testing instructions.
 */

.section .text
.global _start
_start:

    // Start program
    LI t0, 0x01 
    LI t1, 0x02

    // Test Branches
    BEQ t0, t1, 0x0000
    BNE t0, t1, 0x0000
    BLT t0, t1, 0x0000
    BGE t0, t1, 0x0000
    BLTU t0, t1, 0x0000
    BGEU t0, t1, 0x0000

    // Test Load/Store
    LB t1, 0x0000(t0)
    LH t1, 0x0000(t0)
    LW t1, 0x0000(t0)
    LBU t1, 0x0000(t0)
    LHU t1, 0x0000(t0)
    SB t1, 0x0000(t0)
    SH t1, 0x0000(t0)
    SW t1, 0x0000(t0)

    // Test Jump and Link
    JAL t1, 0x0000
    JALR t1, t0, 0x0000

    // Test Computational Instructions
    LUI t1, 0x0000
    AUIPC t1, 0x0000

    // Test Immediate Instructions
    ADDI t1, t0, 0x0000
    SLTI t1, t0, 0x0000
    SLTIU t1, t0, 0x0000
    XORI t1, t0, 0x0000
    ORI t1, t0, 0x0000 
    ANDI t1, t0, 0x0000
    SLLI t1, t0, 0x0000
    SRLI t1, t0, 0x0000
    SRAI t1, t0, 0x0000

    // Test Register-Register Instructions
    ADD t1, t0, t0
    SUB t1, t0, t0
    SLL t1, t0, t0
    SLT t1, t0, t0
    SLTU t1, t0, t0
    XOR t1, t0, t0
    SRL t1, t0, t0
    SRA t1, t0, t0
    OR t1, t0, t0
    AND t1, t0, t0

    // Exit program
    li a1, 0        
    li a0, 0   
    ecall           


    
    // Branch to #0x8000 if t0 == t1
    // li t0, 0x01
    // li t1, 0x01
    // beq t0, t1, 0x8000

    // Set the instruction at 0x8000 to "li t0, 0x03"
    // li t0, 0x03 <= wrong, should be instruction instead of data
    // li t1, 0x8000
    // sw t0, 0x0000(t1)
    //li t0, 0x12345678  // 將 32 位的數據 0x12345678 加載到 t0 暫存器中
    //li t1, 0x8000      // 將記憶體地址 0x8000 加載到 t1 暫存器中
    //sw t0, 0(t1)       // 將 t0 暫存器中的數據存儲到 t1 暫存器指向的記憶體地址中



