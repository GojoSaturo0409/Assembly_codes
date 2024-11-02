.global max_sum
max_sum:
movq %rdi,%r14          # Store the input size in r14
movq %r14,%r15          # Copy input size to r15
subq $1,%r15            # Decrement input size by 1
movq $1,%r10            # Initialize counter r10 to 1
movq $1,%r13            # Initialize counter r13 to 1
movq $-999999999999,%rax   # Initialize maximum sum to a very low value
movq (%rcx),%r12        # Load the first element of the array into r12
jmp preterm             # Jump to the preterm label

preterm:
movq $0,(%r8)           # Initialize the first element of the prefix sum array to 0
movq (%rcx),%r11        # Load the first element of the array into r11
movq %r11,(%r8,%r10,8)  # Store the first element of the array in the prefix sum array
jmp prefix_sum          # Jump to the prefix_sum label

prefix_sum:
addq $1,%r10            # Increment the counter r10
movq (%rcx,%r13,8),%r11 # Load the next element of the array into r11
addq $1,%r13            # Increment the counter r13
addq %r11,%r12          # Add the element to the running sum in r12
movq %r12,(%r8,%r10,8)  # Store the running sum in the prefix sum array
cmpq %r13,%r15          # Compare r13 to r15 
jl nxt                  # Jump to nxt if r13 is less than r15
jmp prefix_sum          # Otherwise, continue to compute prefix sums

nxt:
movq $0,%r10            # Reset the counter r10 to 0
movq %rsi,%r11          # Copy rsi to r11 
movq %rdx,%r12          # Copy rdx to r12 
jmp nxt2                # Jump to nxt2 label

nxt2:
addq %r10,%r11          # Add r10 to r11
addq %r10,%r12          # Add r10 to r12
cmpq %r11,%r14          # Compare r11 to r14 
jl end2                 # Jump to end2 if r11 is less than r14
cmpq %r12,%rdi          # Compare r12 to rdi 
jle hand2               # Jump to hand2 if r12 is less than or equal to rdi
jmp adder               # Otherwise, jump to adder

adder:
cmpq %r11,%r12          # Compare r11 to r12
jl hand1                # Jump to hand1 if r11 is less than r12
cmpq (%r8,%r11,8),%r9   # Compare the prefix sum at index r11 to r9
jle mover               # Jump to mover if the prefix sum is less than or equal to r9
addq $1,%r11            # Otherwise, increment r11
jmp adder               # Continue to compare prefix sums

mover:
movq (%r8,%r11,8),%r9   # Move the prefix sum at index r11 into r9
addq $1,%r11            # Increment r11
jmp adder               # Continue to compare prefix sums

hand1:
subq (%r8,%r10,8),%r9   # Subtract the prefix sum at index r10 from r9
cmpq %r9,%rax           # Compare r9 to the current maximum sum in rax
jle move2               # Jump to move2 if r9 is less than or equal to rax
addq $1,%r10            # Otherwise, increment r10
movq %rsi,%r11          # Copy rsi to r11 
movq %rdx,%r12          # Copy rdx to r12 
jmp nxt2                # Jump to nxt2

move2:
movq %r9,%rax           # Update the maximum sum with r9
movq $-999999999999,%r9    # Reset r9 to a very low value
addq $1,%r10            # Increment r10
movq %rsi,%r11          # Copy rsi to r11 
movq %rdx,%r12          # Copy rdx to r12 
jmp nxt2                # Jump to nxt2

hand2:
movq %r14,%r12          # Copy r14 to r12
jmp adder               # Jump to adder

end:
ret                     # Return from the function

end2:
cmpq %rdi,%rdx          # Compare rdi to rdx
jne end                 # Jump to end if rdi is not equal to rdx
cmpq (%r8,%r14,8),%rax  # Compare the prefix sum at index r14 to rax
jl move3                # Jump to move3 if the prefix sum is less than rax
jmp end                 # Otherwise, return from the function

move3:
movq (%r8,%r14,8),%rax  # Move the prefix sum at index r14 into rax
jmp end                 # Return from the function
