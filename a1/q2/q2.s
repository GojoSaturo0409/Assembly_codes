.global rotate_left      # Global declaration of the symbol rotate_left

rotate_left:            # Definition of the rotate_left label
movq %rdi, %rdx         # Move the number of elements in array to the register rdx
movq %rdx,%r10          # Copy the value of rdx to r10 for later use
subq $1,%r10            # Subtract 1 from r10
movq (%rsi), %rax       # Move the first element of the array to the register rax
movq $0, %rcx           # Initialize the counter rcx to 0
movq $1,%r11            # Initialize another counter r11 to 1

loop:                   # Start of loop
cmpq %rcx , %rdx        # Compare the value in rdx with the value in rcx
jle end                 # Jump to end if rdx is less than or equal to rcx
cmpq %r11,%r10          # Compare r11 with r10
jl end                  # Jump to end if r10 is less than r11
cmpq %rcx,%rdx          # Compare the value in rdx with the value in rcx
jg swap                 # Jump to swap if rcx is greater than rdx

swap:                   # Swap label
movq (%rsi,%rcx,8),%r8  # Move the value at the memory address pointed by (rsi + rcx*8) to register r8
movq (%rsi,%r11,8),%r9  # Move the value at the memory address pointed by (rsi + r11*8) to register r9
movq %r8,(%rsi,%r11,8) # Move the value in r8 to the memory address pointed by (rsi + r11*8)
movq %r9,(%rsi,%rcx,8) # Move the value in r9 to the memory address pointed by (rsi + rcx*8)
addq $1,%rcx            # Increment rcx
addq $1,%r11            # Increment r11
cmpq %r11,%rdx          # Compare r11 with rdx
jl end                  # Jump to end if rdx is less than r11
cmpq %rcx , %rdx        # Compare the value in rdx with the value in rcx
jle end                 # Jump to end if rdx is less than or equal to rcx
movq (%rsi,%rcx,8),%rax # Move the next element in the array to register rax
jmp loop                # Jump back to the beginning of the loop

end:                    # End label
ret                     # Return from the function
