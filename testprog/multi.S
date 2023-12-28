.section .text
.global _start
_start:
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
    li a1, 0       # System call number for exit
    li a0, 0        # Exit code 0
    ecall

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
    