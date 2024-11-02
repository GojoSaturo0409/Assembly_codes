.global baseball_calc

baseball_calc:
movq %rdx,%rcx         # Copy the input size into rcx
subq $1,%rcx           # Decrement the input size by 1
movzbq (%rsi),%r12     # Load the first character of the input string into r12
movq $0,%rax           # Initialize the result accumulator to 0
movq $0,%rbx           # Initialize the loop counter to 0
movq $0,%r13           # Initialize the stack counter to 0
pushq %rbp             # Preserve the value of rbp on the stack
movq %rsp,%rbp         # Set the stack frame base pointer
jmp comparator         # Jump to the comparator

comparator:
cmpq $'C',%r12         # Compare r12 to 'C'
je chandler            # Jump to chandler if r12 is 'C'
cmpq $'D',%r12         # Compare r12 to 'D'
je dhandler            # Jump to dhandler if r12 is 'D'
cmpq $'+',%r12         # Compare r12 to '+'
je phandler            # Jump to phandler if r12 is '+'
cmpq $32,%r12          # Compare r12 to space (' ')
je removspac           # Jump to removspac if r12 is space
cmpq $'-',%r12         # Compare r12 to '-'
je minushandler        # Jump to minushandler if r12 is '-'
jmp integerDealer      # Otherwise, jump to integerDealer

chandler:
popq %r9               # Pop the top element from the stack into r9
subq $1,%r13           # Decrement the stack counter
jmp nxt                # Jump to nxt

dhandler:
popq %r9               # Pop the top element from the stack into r9
subq $1,%r13           # Decrement the stack counter
movq %r9,%r10          # Copy r9 to r10
pushq %r9              # Push r9 onto the stack
addq $1,%r13           # Increment the stack counter
imulq $2,%r10          # Multiply r10 by 2
pushq %r10             # Push r10 onto the stack
addq $1,%r13           # Increment the stack counter
jmp nxt                # Jump to nxt

phandler:
popq %r9               # Pop the top element from the stack into r9
subq $1,%r13           # Decrement the stack counter
popq %r10              # Pop the next element from the stack into r10
subq $1,%r13           # Decrement the stack counter
movq $0,%r11           # Initialize r11 to 0
addq %r10,%r11         # Add r10 to r11
pushq %r10             # Push r10 onto the stack
addq $1,%r13           # Increment the stack counter
addq %r9,%r11          # Add r9 to r11
pushq %r9              # Push r9 onto the stack
addq $1,%r13           # Increment the stack counter
pushq %r11             # Push r11 onto the stack
addq $1,%r13           # Increment the stack counter
jmp nxt                # Jump to nxt

integerDealer:
subq $48,%r12          # Convert character to integer by subtracting ASCII value of '0'
pushq %r12             # Push the integer onto the stack
addq $1,%r13           # Increment the stack counter
jmp nxt                # Jump to nxt

integerDealer2:
pushq %r12             # Push the integer onto the stack
addq $1,%r13           # Increment the stack counter
jmp nxt                # Jump to nxt

nxt:
addq $1,%rbx           # Increment the loop counter
cmpq %rbx,%rcx         # Compare the loop counter to the input size
jle adding_final       # Jump to adding_final if the loop counter is less than or equal to the input size
movzbq (%rsi,%rbx,1),%r12  # Load the next character of the input string into r12
jmp comparator         # Jump back to the comparator

minushandler:
addq $1,%rbx           # Increment the loop counter
movzbq (%rsi,%rbx,1),%r12  # Load the next character of the input string into r12
subq $48,%r12          # Convert character to integer by subtracting ASCII value of '0'
imulq $-1,%r12         # Multiply the integer by -1
jmp integerDealer2    # Jump to integerDealer2

removspac:
addq $1,%rbx           # Increment the loop counter
movzbq (%rsi,%rbx,1),%r12  # Load the next character of the input string into r12
jmp comparator         # Jump back to the comparator

adding_final:
cmpq $0,%r13           # Compare the stack counter to 0
je end                 # Jump to end if the stack counter is 0
subq $1,%r13           # Decrement the stack counter
popq %r9               # Pop the top element from the stack into r9
addq %r9,%rax          # Add r9 to the result accumulator
jmp adding_final       # Jump back to adding_final

end:
movq %rbp,%rsp         # Restore the stack frame base pointer
popq %rbp              # Restore the value of rbp
ret                    # Return from the function
