.global post_fix_eval

post_fix_eval:
movq %rdi,%r8         # Copy the input size into r8
subq $1,%r8           # Decrement the input size by 1
movzbq (%rsi),%rcx    # Load the first character of the input string into rcx
movq $0,%r14          # Initialize a counter r14 to 0
pushq %rbp            # Preserve the value of rbp on the stack
movq %rsp,%rbp        # Set the stack frame base pointer
jmp comparator        # Jump to the comparator

comparator:
cmpq $'*',%rcx       # Compare rcx to '*'
je multiply           # Jump to multiply if rcx is '*'
cmpq $'+',%rcx       # Compare rcx to '+'
je adder              # Jump to adder if rcx is '+'
cmpq $'-',%rcx       # Compare rcx to '-'
je subtractor         # Jump to subtractor if rcx is '-'
cmpq $'/',%rcx       # Compare rcx to '/'
je divide             # Jump to divide if rcx is '/'
jmp integerDealer     # Otherwise, jump to integerDealer

subtractor:
popq %r10            # Pop the top element from the stack into r10
popq %r11            # Pop the next element from the stack into r11
subq %r10,%r11       # Subtract r10 from r11
pushq %r11           # Push the result onto the stack
jmp nxt              # Jump to nxt

adder:
popq %r10            # Pop the top element from the stack into r10
popq %r11            # Pop the next element from the stack into r11
addq %r11,%r10       # Add r11 to r10
pushq %r10           # Push the result onto the stack
jmp nxt              # Jump to nxt

multiply:
popq %r10            # Pop the top element from the stack into r10
popq %r9             # Pop the next element from the stack into r9
imulq %r10,%r9       # Multiply r10 by r9
pushq %r9            # Push the result onto the stack
jmp nxt              # Jump to nxt

divide:
popq %r10            # Pop the top element from the stack into r10
popq %r9             # Pop the next element from the stack into r9
movq %r9,%rax        # Move r9 into rax (dividend)
cqto                 # Sign extend to rdx:rax
idivq %r10           # Divide rax by r10 (quotient in rax, remainder in rdx)
pushq %rax           # Push the quotient onto the stack
jmp nxt              # Jump to nxt

integerDealer:
subq $48,%rcx        # Convert character to integer by subtracting ASCII value of '0'
pushq %rcx           # Push the integer onto the stack
jmp nxt              # Jump to nxt

nxt:
cmpq %r14,%r8        # Compare the counter to the input size
jle end              # Jump to end if the counter is less than or equal to the input size
addq $1,%r14         # Increment the counter
movzbq (%rsi,%r14,1),%rcx  # Load the next character of the input string into rcx
cmpq $32,%rcx        # Compare rcx to ' '
jmp removspac        # Jump to removspac if rcx is ' '
jmp comparator       # Otherwise, jump to comparator

removspac:
addq $1,%r14         # Increment the counter
movzbq (%rsi,%r14,1),%rcx  # Load the next character of the input string into rcx
jmp comparator       # Jump back to comparator

end:
popq %rax            # Pop the result from the stack into rax
movq %rbp,%rsp       # Restore the stack frame base pointer
popq %rbp            # Restore the value of rbp
ret                  # Return from the function
