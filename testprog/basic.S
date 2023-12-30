.section .text
.global _start
_start:
    # Start program
    addi t0, x0, 1  # set t0 = 1
    sw t0, 0(a0)   #set a0 = 1
    addi t1, x0, 2  # set t1 = 2
    sw t1, 4(a0)    # set a1 = 2

    TestBranches:
        BNE t0, t1, next_1 # if t0 != t1, go to next_1
        JAL Excep   # Error happened
        next_1:
            addi t0, x0, 12 # set t0 = 12
            addi t1, x0, 12 # set t1 = 12
            BEQ t0, t1, next_2  # if t0 == t1, go to next_2
            JAL Excep   # Error happened
        next_2:
            addi t0, x0, -1  # set t0 = -1
            addi t1, x0, 2  # set t1 = 2
            BLT t0, t1, next_3  # if t0 < t1 (signed), go to next_3
            JAL Excep   # Error happened
        next_3:
            addi t0, x0, 2  # set t0 = 2
            addi t1, x0, -1 # set t1 = -1
            BGE t0, t1, next_4  # if t0 >= t1 (signed)  go to next_4
            JAL Excep   # Error happened
        next_4:
            addi t0, x0, 1  # set t0 = 1
            addi t1, x0, 2  # set t1 = 2
            BLTU t0, t1, next_5 # if t0 < t1 (unsigned) go to next_5
            JAL Excep   # Error happened
        next_5:
            addi t0, x0, 2  # set t0 = 2
            addi t1, x0, 1  # set t1 = 1
            BGEU t0, t1, TestLoadStore # if t0 >= t1  (unsigned)    go to TestLoadStore
            JAL Excep   # Error happened

    TestLoadStore:  
        addi t0, x0, 1  # set t0 = 1
        sw t0, 0(a0)    # set a0 = 1
        
        # SW
        sw t0, 12(a0)   # Store t0 in a3, a3 = 0x0000 0001
        addi t0, x0, -1 # Update t0 = 0x(FFFF F)FFF => -1 (12bits)
        sw t0, 0(a0)    # Store t0 in a0, a0 = 0xFFFF FFFF
        lw a0, 12(a0)    # Load a3 to a0, a0 = 0x0000 0001
        BEQ a0, t0, Excep   # if a0 == t0, Error happened

        # SH
        addi t0, x0, 0  # set t0 = 0
        sw t0, 12(a0)   # Store t0 in a3, a3 = 0x0000 0000

        addi t0, x0, -1  # Update t0 = 0x(FFFF F)FFF => -1 (12bits)
        SW t0, 8(a0)     # Store t0 (32bits) in a2, a2 = 0xFFFF FFFF
        SH t0, 12(a0)    # Store t0 (16bits) in a3, a3 = 0x0000 FFFF
        LHU a1, 12(a0)   # Load a3 to a1 (unsigned, 16bits), a1 = 0x0000 FFFF
        LH a0, 12(a0)    # Load a3 to a0 (signed, 16bits), a0 = 0xFFFF FFFF
        BEQ a1, a2, Excep   # if a1 == a2, Error happened
        BNE a0, a2, Excep   # if a0 != a2, Error happened

        # SB
        addi t0, x0, 0 # set t0 = 0
        sw t0, 12(a0)   # Store t0 in a3, a3 = 0x0000 0000

        addi t0, x0, 0xFF0 # Update t0 = 0x(FFFF F)FF0 => (12bits) 0xFF0
        SW t0, 8(a0)     # Store t0 (32bits) in a2, a2 = 0xFFFF FFF0
        SB t0, 12(a0)    # Store t0 (8bits) in a3, a3 = 0x0000 00F0
        LBU a1, 12(a0)   # Load a3 to a1 (unsigned, 8bits), a1 = 0x0000 00F0
        LB a0, 12(a0)    # Load a3 to a0 (signed, 8bits), a0 = 0xFFFF FFF0
        BEQ a1, a2, Excep   # if a1 == a2, Error happened
        BNE a0, a2, Excep   # if a0 != a2, Error happened
        
    TestJumps:
        AUIPC a0, 0 # a0 = 0x0000 0000 + PC
        JALR a0, a0, 8 # a0 = 0x0000 0008 + PC
        addi x0, x0, 0 # NOP
        addi x0, x0, 0 # NOP
        JAL TestComputationalInstructions   
    
    TestComputationalInstructions:
        LUI a0, 1048575 # a0 = 0x(FFFF F)000
        SRLI a0, a0, 4 # a0 = 0x0FFF FF00
        SLLI a0, a0, 4 # a0 = 0xFFF0 0000
        SRAI a0, a0, 4 # a0 = 0xFFFF FF00

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
        JAL EXIT

    Excep:
        addi t0, x0, 15
        addi t1, x0, 15
        JAL EXIT
    
        addi a0, x0, 0
        addi a1, x0, 0
    EXIT:
        ecall      # Exit program