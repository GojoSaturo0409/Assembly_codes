.global comb
comb:
movq $0,%r8           # Initialize counter r8 to 0
movq %rsi,%r9         # Copy the value of the second parameter into r9
movq $1,%rcx          # Initialize the result to 1
jmp comb2             # Jump to comb2

comb2:
pushq %rbp            # Preserve the value of rbp on the stack
movq %rsp,%rbp        # Set the stack frame base pointer
pushq %rbx            # Preserve the value of rbx on the stack
subq $8,%rsp          # Allocate space on the stack for local variables
movq 16(%rbp),%rbx    # Load the second parameter into rbx
movq $1,%rax          # Initialize the result to 1
# cmpq $1,%rbx       
cmpq %r8,%rsi         # Compare r8 to the second parameter
jle next              # Jump to next if r8 is less than or equal to the second parameter
leaq -1(%rbx),%rax    # Load effective address of (rbx - 1) into rax
addq $1,%r8           # Increment r8
movq %rax,(%rsp)      # Store the updated value of rax on the stack
call comb2            # Recursive call to comb2
imulq %rbx,%rax       # Multiply the result by rbx
subq $1,%r8           # Decrement r8
cmpq $0,%r8           # Compare r8 to 0
je comb3              # Jump to comb3 if r8 is 0
next:
addq $8,%rsp          # Release space allocated for local variables on the stack
popq %rbx             # Restore the value of rbx
popq %rbp             # Restore the value of rbp
ret                   # Return from the function

comb3:
cmpq $1,%r9           # Compare r9 to 1
je nxtf               # Jump to nxtf if r9 is equal to 1
imulq %r9,%rcx        # Multiply rcx by r9
subq $1,%r9           # Decrement r9
jmp comb3             # Jump to comb3

nxtf:
movq $0,%rdx          # Clear rdx (high part of dividend for division)
idivq %rcx            # Divide rdx:rax by rcx
movq %rbp,%rsp        # Restore the stack frame base pointer
popq %rbp             # Restore the value of rbp
ret                   # Return from the function
