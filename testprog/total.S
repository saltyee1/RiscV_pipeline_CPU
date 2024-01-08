.section .text
.global _start

_start:

Basic:
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
        LW a2, 8(a0)     # Load a2 to a2, a2 = 0xFFFF FFFF
        SH t0, 12(a0)    # Store t0 (16bits) in a3, a3 = 0x0000 FFFF
        LHU a1, 12(a0)   # Load a3 to a1 (unsigned, 16bits), a1 = 0x0000 FFFF
        LH a0, 12(a0)    # Load a3 to a0 (signed, 16bits), a0 = 0xFFFF FFFF
        BEQ a1, a2, Excep   # if a1 == a2, Error happened
        BNE a0, a2, Excep   # if a0 != a2, Error happened

        # SB
        addi t0, x0, 0 # set t0 = 0
        sw t0, 12(a0)   # Store t0 in a3, a3 = 0x0000 0000

        addi t0, x0, -16 # Update t0 = 0x(FFFF F)FF0 => (12bits) 0xFF0
        SW t0, 8(a0)     # Store t0 (32bits) in a2, a2 = 0xFFFF FFF0
        lw a2, 8(a0)     # Load a2 to a2, a2 = 0xFFFF FFF0
        SB t0, 12(a0)    # Store t0 (8bits) in a3, a3 = 0x0000 00F0
        LBU a1, 12(a0)   # Load a3 to a1 (unsigned, 8bits), a1 = 0x0000 00F0
        LB a0, 12(a0)    # Load a3 to a0 (signed, 8bits), a0 = 0xFFFF FFF0
        BEQ a1, a2, Excep   # if a1 == a2, Error happened
        BNE a0, a2, Excep   # if a0 != a2, Error happened
        
    TestJumps:
        AUIPC a0, 0 # a0 = 0x0000 0000 + PC
        JALR a0, a0, 24 # a0 = 0x0000 0008 + PC
        addi x0, x0, 0 # NOP
        addi x0, x0, 0 # NOP
        addi x0, x0, 0 # NOP
        addi x0, x0, 0 # NOP
        JAL TestComputationalInstructions   
        addi x0, x0, 0 # NOP
        addi x0, x0, 0 # NOP   
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
        # JAL EXIT
        JAL Fibo

    Excep:
        addi t0, x0, 15
        addi t1, x0, 15
        JAL EXIT

Fibo:

    # Initialize memory address to store Fibonacci numbers
    li a0, 0
    lui sp, 8 #sp = 0x8000

    # Load initial parameters for Fibonacci calculation
    li a1, 10       # Number of Fibonacci numbers to calculate
    li a2, 5        # Initial Fibonacci value (F(0))
    li a3, 5        # Initial Fibonacci value (F(1))
    li a5, 0
    li t0, 5
    li t1, -5

    # Call the Fibonacci function
    jal ra, fibonacci

    # Exit program
    # li a1, 0       # System call number for exit
    # li a0, 0        # Exit code 0
    # ecall
    jal Multi

    # Recursive Fibonacci function
    # Parameters: a0 = memory address to store result, a1 = number of Fibonacci numbers,
    #             a2 = current Fibonacci value (F(n)), a3 = next Fibonacci value (F(n+1))
    fibonacci:
        # Check if we have calculated enough Fibonacci numbers
        bnez a1, continue_fibonacci

        # If done, return from the recursive call
        ret
    continue_fibonacci:
    # Store the current Fibonacci value in memory
    mul a4, a2, a3   # F(n) + F(n+1)
    mulh a5, a2, a3
    sw a4, 0(a0)
    sw a5, 4(a0)

    mul a2, a2, t1
    mul a3, a3, t0

    # Update memory address to store the next Fibonacci value
    addi a0, a0, 8

    # Decrement the count of remaining Fibonacci numbers
    addi a1, a1, -1

    # Recursive call to calculate the next Fibonacci number
    j fibonacci

    # Return from the current recursive call
    #ret
    
Multi:
    li a0, 0
    lui sp, 8 #sp = 0x8000


    li a1, 1
    li a2, -1
    mul a1, a1, a2
    mulh a1, a1, a2
    mulhu a1, a1, a2
    li a1, 0
    li a2, 0
    mul a1, a1, a2
    lui a1, 0x0ffff
    addi a1, a1, 0x0ff
    lui a2, 0x0ffff
    addi a2, a1, 0x0ff
    mul a1, a1, a2
    mulh a1, a1, a2
    mulhu a1, a1, a2

    # high bits multiple
    #for (i = 0x0000 0000, i < 0xFFFF FFFF, i++){
    #    for (j = 0x0000 0000, j < 0xFFFF FFFF, j++){
    #        mul a2, i, j
    #        mulh a2, i, j
    #        mulhu a2, i, j
    #    }
    #}
    addi a0, x0, -1024
    addi a1, x0, -1024
    addi t0, x0, 1023
    SLLI t1, a0, 24
    SLLI t2, a1, 24
    block_start:
        bge a0, t0, block_end   # >= t0
        block2_start:
            bge a1, t0, block2_end
            mul a2, t1, t2
            mulh a2, t1, t2
            mulhu a2, t1, t2
            addi a1, a1, 1
            SLLI t2, a1, 22
            j block2_start
        block2_end:
            addi a1, zero, -1024
            addi a0, a0, 1
            SLLI t1, a0, 22
            j block_start
    block_end:
        addi x0, x0, 0
    # 68% total toggle, for 8bits

    li a1, 1
    li a2, 1
    li t0, 3
    addi a3, zero, 20
Multi3_loop:
    mul a5, a1, a2
    mul a1, a1, t0
    mul a2, a2, t0
    addi a3, a3, -1
    bne a3, zero, Multi3_loop

    li a1, 1
    li a2, 1
    li t0, 2
    addi a3, zero, 30
Multi2_loop:
    mul a5, a1, a2
    mul a1, a1, t0
    mul a2, a2, t0
    addi a3, a3, -1
    bne a3, zero, Multi2_loop

    # Load initial parameters for Fibonacci calculation
    li a1, 10       # Number of Fibonacci numbers to calculate
    li a2, 5        # Initial Fibonacci value (F(0))
    li a3, 5        # Initial Fibonacci value (F(1))
    li a5, 0
    li t0, 5
    li t1, -5

    # Call the Fibonacci function
    jal ra, fib1

    # Exit program
    # li a1, 0       # System call number for exit
    # li a0, 0        # Exit code 0
    # ecall
    jal Sort

    # Recursive Fibonacci function
    # Parameters: a0 = memory address to store result, a1 = number of Fibonacci numbers,
    #             a2 = current Fibonacci value (F(n)), a3 = next Fibonacci value (F(n+1))
    fib1:
    # Check if we have calculated enough Fibonacci numbers
    bnez a1, continue_fibo
    # If done, return from the recursive call
    ret

    continue_fibo:
    # Store the current Fibonacci value in memory
    mul a4, a2, a3   # F(n) + F(n+1)
    mulh a5, a2, a3
    sw a4, 0(a0)
    sw a5, 4(a0)

    mul a2, a2, t1
    mul a3, a3, t0

    # Update memory address to store the next Fibonacci value
    addi a0, a0, 8

    # Decrement the count of remaining Fibonacci numbers
    addi a1, a1, -1

    # Recursive call to calculate the next Fibonacci number
    j fib1

    # Return from the current recursive call
    #ret

Sort:
    lui sp, 0x1
    addi sp, sp, 0
    # Store array values in contiguous memory at mem address 0x0:  
    # {1, 5, 3, 4, 10, 22, 2, 3, 44}
 addi a0, x0, 0

 addi t0, x0, 1
 sw t0, 0(a0) 
 addi t0, x0, 5
 sw t0, 4(a0)
 addi t0, x0, 3
 sw t0, 8(a0)
 addi t0, x0, 4
 sw t0, 12(a0)
 addi t0, x0, 10
 sw t0, 16(a0)
 addi t0, x0, 22
 sw t0, 20(a0)
 addi t0, x0, 2
 sw t0, 24(a0)
 addi t0, x0, 3
 sw t0, 28(a0)
 addi t0, x0, 44
 sw t0, 32(a0)

    addi a1, x0, 9   # size of 'arr'

    jal ra, SEL_SORT
    jal ra, EXIT

    SEL_SORT:
    addi sp, sp, -8
    sw ra, 4(sp)
    sw s0, 0(sp)

    addi t0, x0, 0 # i
    addi t1, x0, 0 # j
    addi t2, x0, 0 # min_index

    addi s0, a1, 0 # store n.
    addi a1, a1, -1 # n-1
    UNSORTED_ARRAY_BOUNDARY_LOOP:
    beq t0, a1, END_UNSORTED_ARRAY_BOUNDARY_LOOP # (while i < (n-1))

    addi t2, t0, 0   # min_index = i
    addi t1, t0, 1   # j = i + 1

    SUBARRAY_LOOP:   
    beq t1, s0, END_SUBARRAY_LOOP # (while j < n)

    slli t5, t1, 2  # j * sizeof(int)
    add t6, a0, t5
    lw t4, 0(t6)    # Load arr[j]   

    slli t5, t2, 2  # min_index * sizeof(int)
    add t6, a0, t5  # arr[min_index]
    lw t3, 0(t6)    # Load arr[min_index] 

    blt t3, t4, MIN_REMAINS_SAME # if (arr[min_index] < arr[j]), don't change the min.
    addi t2, t1,0   # min_index = j
    MIN_REMAINS_SAME:

    addi t1, t1, 1  # j = j + 1
    beq x0, x0, SUBARRAY_LOOP
    END_SUBARRAY_LOOP:

    slli t5, t2, 2    # min_index * sizeof(int)
    add t6, a0, t5    # arr[min_index]
    lw t3, 0(t6)      # Load arr[min_index]  

    slli t1, t0, 2    # i * sizeof(int)
    add t1, t1, a0    # arr[i] 
    lw t4, 0(t1)      # Load arr[i]

    sw t3, 0(t1)
    sw t4, 0(t6)      # swap(&arr[min_index], &arr[i])

    addi t0, t0, 1   # i = i + 1
    beq x0, x0, UNSORTED_ARRAY_BOUNDARY_LOOP
    END_UNSORTED_ARRAY_BOUNDARY_LOOP: 

    lw s0, 0(sp)
    lw ra, 4(sp)
    addi sp, sp, 8
    jalr x0, ra, 0

EXIT:
    addi a0, x0, 0
    addi a1, x0, 0
    lui a2, 0x0000f
    jalr a2, 0x7f0
    addi a3, zero, 0
    addi a3, zero, 0
    addi a3, zero, 0
    ecall      # Exit program

##at 0000f7f0
EXIT_HIGH :
    ecall      # Exit program
