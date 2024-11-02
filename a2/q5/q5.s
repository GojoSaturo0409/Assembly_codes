.global binary_search

binary_search:
movq $32,%r10    # Set length of the array to 32
movq $31,%r13    # Set ending index to 31
movq $0,%rbx     # Initialize counter rbx to 0
movq $0,%rcx     # Initialize variable rcx to 0
movq $0,%r12     # Initialize starting index to 0
# movq (%rdi),%r9
jmp bsearchmain  # Jump to bsearchmain label

bsearchmain:
movq (%rdi),%r8     # Load the base address of the array into r8
# movq (%rdi,%r13,8),%r10
shr $1,%r13         # Shift right r13 by 1
addq $1,%rbx        # Increment counter rbx by 1
movq (%rdi,%r13,8),%rcx  # Load the middle element of the array into rcx
movq $31,%r13       # Reset ending index to 31
movq %r13,%r11      # Copy ending index to r11
shr $1,%r11         # Shift right r11 by 1
jmp comparer        # Jump to comparer label

comparer:
cmpq $0,%r10        # Compare length to 0
je end2             # Jump to end2 if length is 0
movq %r11,%r14      # Copy r11 to r14
subq $1,%r14        # Decrement r14 by 1
movq (%rdi,%r14,8),%r15  # Load the element at index r14 into r15
cmpq %r15,%rcx     # Compare r15 with rcx (middle element)
je prelim          # Jump to prelim if they are equal
jmp comp2          # Jump to comp2 otherwise

comp2:
cmpq %rsi,%rcx     # Compare search value (rsi) with rcx (middle element)
je end              # Jump to end if they are equal
cmpq %rcx,%rsi     # Compare rcx (middle element) with search value (rsi)
jl endmove         # Jump to endmove if rcx is less than search value
cmpq %rcx,%rsi     # Compare rcx (middle element) with search value (rsi)
jg startmove       # Jump to startmove if rcx is greater than search value

prelim:
cmpq %rcx,%rsi     # Compare rcx (middle element) with search value (rsi)
je endmove         # Jump to endmove if they are equal
jmp comp2          # Jump back to comp2 otherwise

startmove:
shr $1,%r10        # Shift right length (r10) by 1
addq %r10,%r12     # Add length (r10) to starting index (r12)
addq $1,%rbx       # Increment counter rbx by 1
# movq %r10,%r12
movq %r10,%r11     # Copy length (r10) to r11
shr $1,%r11        # Shift right r11 by 1
addq %r12,%r11     # Add starting index (r12) to r11
subq $1,%r11       # Decrement r11 by 1
cmpq $1,%r10       # Compare length (r10) to 1
je adder           # Jump to adder if length is 1
jmp continuer      # Jump to continuer otherwise

continuer:
movq (%rdi,%r11,8),%rcx  # Load the element at index r11 into rcx
jmp comparer       # Jump to comparer

endmove:
shr $1,%r10        # Shift right length (r10) by 1
addq $1,%rbx       # Increment counter rbx by 1
subq %r10,%r13     # Subtract length (r10) from ending index (r13)
movq %r10,%r14     # Copy length (r10) to r14
# subq %r10,%r14   # Subtract length (r10) from r14
shr $1,%r14        # Shift right r14 by 1
movq %r12,%r11     # Copy starting index (r12) to r11
addq %r14,%r11     # Add r14 to r11
subq $1,%r11       # Decrement r11 by 1
movq (%rdi,%r11,8),%rcx  # Load the element at index r11 into rcx
jmp comparer       # Jump to comparer

adder:
addq $1,%r11       # Increment r11 by 1
jmp continuer      # Jump to continuer

end:
movq $1,%r10       # Set length (r10) to 1
movq %r11,(%rdx)   # Store index of the found element
movq %rbx,(%rdx,%r10,8)  # Store number of comparisons
ret                # Return from the function

end2:
movq $1,%r10       # Set length (r10) to 1
movq $-1,(%rdx)    # Store -1 in the result pointer
movq %rbx,(%rdx,%r10,8)  # Store number of comparisons
ret                # Return from the function
