.global lonely_number    # Global declaration of the symbol lonely_number

lonely_number:          # Definition of the lonely_number label
movq %rdi,%rdx          # Move the value of the first argument (rdi) to the register rdx
movq (%rsi),%rax        # Move the first element of array to the register rax
imulq $2,%rdx           # Multiply the value in rdx by 2
addq $1,%rdx            # Add 1 to the value in rdx
movq $0,%rcx            # Initialize the counter rcx to 0
movq $0,%r8             # Initialize the accumulator r8 to 0

loop:                   # Start of loop
cmpq %rcx , %rdx        # Compare the value in rdx with the value in rcx
jle end                 # Jump to end if rdx is less than or equal to rcx
xor %r8,%rax            # XOR operation between the accumulator r8 and the value in rax
movq %rax,%r8           # Move the result to the accumulator r8
addq $1,%rcx            # Increment the counter rcx
movq (%rsi,%rcx,8),%rax # Move  the next element in the array by addressing to rax
jmp loop                # Jump back to the beginning of the loop

end:                    # End label
movq %r8,%rax           # Move the final result from accumulator r8 to register rax
ret                     # Return from the function
