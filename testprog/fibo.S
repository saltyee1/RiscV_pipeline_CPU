.section .text
.global _start
_start:
    # Initialize memory address to store Fibonacci numbers
    li a0, 0
    lui sp, 8 #sp = 0x8000

    # Load initial parameters for Fibonacci calculation
    li a1, 10       # Number of Fibonacci numbers to calculate
    li a2, 0        # Initial Fibonacci value (F(0))
    li a3, 1        # Initial Fibonacci value (F(1))

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
    sw a2, 0(a0)
    #save f(n) in x3
    addi x3, a2, 0

    # Calculate the next Fibonacci value
    add a4, a2, a3   # F(n) + F(n+1)
    mv a2, a3        # F(n+1) <- F(n)
    mv a3, a4        # F(n+1) <- F(n) + F(n+1)

    # Update memory address to store the next Fibonacci value
    addi a0, a0, 4

    # Decrement the count of remaining Fibonacci numbers
    addi a1, a1, -1

    # Recursive call to calculate the next Fibonacci number
    j fibonacci

    # Return from the current recursive call
    #ret