.global small_and_large  # Global declaration of the symbol small_and_large

small_and_large:         # Definition of the small_and_large label
movq %rdi,%rdx          # Move the number of elements in array to the register rdx
movq (%rsi),%rax        # Move the value at the memory address pointed by the second argument (rsi) to the register rax
movq $0,%rcx            # Initialize the counter rcx to 0
movq (%rsi),%r8         # Copy the first element of the array to register r8
movq (%rsi),%r9         # Copy the first element of the array to register r9

loop:                   # Start of loop
cmpq %rcx , %rdx        # Compare the value in rdx with the value in rcx
jle end                 # Jump to end if rcx is greater than or equal to rdx
cmpq %rax,%r8           # Compare the current element (in rax) with the maximum element found so far (in r8)
cmovg %rax,%r8          # Conditional move: if rax is greater than r8, move rax to r8
cmpq %rax,%r9           # Compare the current element (in rax) with the minimum element found so far (in r9)
cmovl %rax,%r9          # Conditional move: if rax is less than r9, move rax to r9
addq $1,%rcx            # Increment the counter rcx
movq (%rsi,%rcx,8),%rax # Move the next element of the array to the register rax
jmp loop                # Jump back to the beginning of the loop

end:                    # End label
addq %r9,%r8            # Add the minimum element (r9) to the maximum element (r8)
movq %r8,%rax           # Move the result to register rax
ret                     # Return from the function
