.global product     # Global declaration of the symbol product

product:            # Definition of the product label
movq %rdi,%r8      # Move the value of the first argument (rdi) to register r8 (loop counter)
movq (%rdx),%rbx    # Move the first element of the array pointed by rdx to register rbx (initial value for multiplication)
movq $0,%rcx        # Initialize the counter rcx to 0 (index for array traversal)
movq $0,%r9        # Initialize r9 to 0 (current index for array)
movq $0,%rax       # Initialize the result rax to 0 (product of array elements)
movq $1,%r10       # Initialize r10 to 1 (initial value for product calculation)

loop:               # Start of loop
cmpq %rcx,%r8       # Compare the value in r8 (loop counter) with the value in rcx (index)
jle end             # Jump to end if r8 is less than equal to rcx (loop counter)
cmpq %r9,%rcx      # Compare r9 (current index) with rcx (index)
je pass             # If equal, jump to pass
cmpq %r9,%rcx      # Compare r9 (current index) with rcx (index)
jg nxt              # If greater, jump to next (nxt)
cmpq %r9,%rcx      # Compare r9 (current index) with rcx (index)
jl nxt              # If less, jump to next (nxt)
pass:               # Pass label
imulq $1,%r10       # Multiply r10 by 1 (no effect)
addq $1,%r9         # Increment r9 (current index)
movq (%rsi,%r9,8),%r11  # Move the next element of the array to register r11
jmp nxt             # Jump to next (nxt)
nxt:                # Next label
cmpq %r9,%r8       # Compare r9 (current index) with r8 (loop counter)
jle endif           # If less or equal, jump to endif
imulq %r11,%r10     # Multiply r10 by r11 (current array element)
addq $1,%r9         # Increment r9 (current index)
movq (%rsi,%r9,8),%r11  # Move the next element of the array to register r11
cmpq %r9,%rcx      # Compare r9 (current index) with rcx (index)
je pass             # If equal, jump to pass
jmp nxt             # Jump to next (nxt)
endif:              # Endif label
movq %r10,%rax      # Move the result (product) in r10 to rax
movq %rax,(%rdx,%rcx,8)  # Move the result (product) in rax to the memory address pointed by (rdx + rcx*8)
addq $1,%rcx        # Increment rcx (index)
movq (%rsi,%rcx,8),%rbx  # Move the value at the memory address pointed by (rsi + rcx*8) to register rbx
movq $0,%r9        # Reset r9 to 0 (current index for array)
movq $1,%r10       # Reset r10 to 1 (initial value for product calculation)
movq (%rsi),%r11   # Move the first element of the array pointed by rsi to register r11 (initial value for multiplication)
jmp loop            # Jump back to the beginning of the loop

end:                # End label
ret                 # Return from the function
