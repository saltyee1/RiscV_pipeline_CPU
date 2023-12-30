.section .text
.global _start
_start:
    # Start program
    addi t0, x0, 1
    sw t0, 0(a0)
    addi t1, x0, 2
    sw t1, 4(a0)

    TestBranches:
        BNE t0, t1, next_1
        JAL Excep
        next_1:
            addi t0, x0, 12
            addi t1, x0, 12
            BEQ t0, t1, next_2  # if t0 == t1
            JAL Excep
        next_2:
            addi t0, x0, -1
            addi t1, x0, 2
            BLT t0, t1, next_3  # if t0 < t1 (signed)
            JAL Excep
        next_3:
            addi t0, x0, 2
            addi t1, x0, -1
            BGE t0, t1, next_4  # if t0 >= t1 (signed)
            JAL Excep
        next_4:
            addi t0, x0, 1
            addi t1, x0, 2
            BLTU t0, t1, next_5 # if t0 < t1 (unsigned)
            JAL Excep
        next_5:
            addi t0, x0, 2
            addi t1, x0, 1
            BGEU t0, t1, TestLoadStore # if t0 >= t1  (unsigned)
            JAL Excep

    TestLoadStore:
        addi t0, x0, 1
        sw t0, 0(a0)
        
        # SW
        sw t0, 12(a0)   # Store t0 to a3, a3 = 0x0000 0001
        addi t0, x0, -2047 # Update t0 = 0xFFFF FFFF
        sw t0, 0(a0)    # Store t0 in a0, t0 = 0xFFFF FFFF
        lw a0, 12(a0)    # Load t0 to a0, a0 = 0x0000 0001
        BEQ a0, t0, Excep   

        # SH
        addi t0, x0, 0  # initialize mem
        sw t0, 12(a0)

        addi t0, x0, -2047
        SW t0, 8(a0)        # Store t0 in a2
        SH t0, 12(a0)    # Store t0 (0xFFFF), mem = 0x0000 FFFF
        LH a0, 12(a0)    # Load t0 to a0 (signed, 16bits), a0 = 0xFFFF FFFF
        LHU a1, 12(a0)   # Load t0 to a1 (unsigned, 16bits), a1 = 0x0000 FFFF
        BNE a1, a2, Excep
        BEQ a0, a2, Excep

        # SB
        addi t0, x0, 0 # initialize mem
        sw t0, 12(a0)

        addi t0, x0, -2032 # 0xFF0
        SW t0, 8(a0)        # Store t0 in a2, a2 = 0xFFFF FFF0
        SB t0, 12(a0)    # Store t0 (0xF0), mem = 0x0000 00F0
        LB a0, 12(a0)    # Load t0 to a0 (signed, 8bits), a0 = 0xFFFF FFF0
        LBU a1, 12(a0)   # Load t0 to a1 (unsigned, 8bits), a1 = 0x0000 00F0
        BNE a1, a2, Excep
        BEQ a0, a2, Excep
        
    TestJumps:
        AUIPC a0, 4
        addi x0, x0, 0 # NOP
        JALR a0, a0, 4
        addi x0, x0, 0 # NOP
        JAL TestComputationalInstructions
    
    TestComputationalInstructions:
        LUI a0, 1048560 # a0 = 0xFFF FFFF0
        SRLI a0, a0, 1 # a0 = 0x7FFFF800
        SLLI a0, a0, 1 # a0 = 0xFFFFF000
        SRAI a0, a0, 1 # a0 = 0xFFFFF800

        ADDI t0, x0, -1 # t0 = -1
        SLTI t1, t0, 0 # t0 < 0x0000, t1 = 0x0001
        SLTIU t1, t0, 0 # t0 > 0x0000, t1 = 0x0000
        ADDI t0, x0, 0 # t0 = 0
        XORI t1, t0, 0 # t0 ^ 0x0000, t1 = 0x1111
        ORI t1, t0, 1 # t0 | 0x001, t1 = 0x0001
        ANDI t1, t0, -2047 # t0 & 1...1, t1 = 0x0000
        SLLI t1, t0, 0 # t0 << 0x000, t1 = 0x0000
    
    TestReg_Reg:
        ADDI t0, x0, 2 # t0 = 2
        ADDI t1, x0, 1 # t1 = 1
        ADD t2, t0, t1 # t2 = 3
        SUB t2, t0, t1 # t2 = 1
        SLL t2, t0, t1 # t2 = 4
        SLT t2, t0, t1 # t0 >= t1, t2 = 0
        ADDI t1, x0, -1 # t1 = -1
        SLTU t2, t0, t1 # t0 < t1, t2 = 1
        ADDI t1, x0, 1 # t1 = 1
        XOR t2, t0, t1 # t2 = 3
        SRL t2, t0, t1 # t2 = 1
        SRA t2, t0, t1 # t2 = 1
        OR t2, t0, t1 # t2 = 3
        AND t2, t0, t1 # t2 = 0

    Excep:
        addi t0, x0, 15
        addi t1, x0, 15
        JAL EXIT

    EXIT:
        addi a0, x0, 0
        addi a1, x0, 0
        ecall      # Exit program