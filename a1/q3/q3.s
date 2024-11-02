.global is_palindrome    # Global declaration of the symbol is_palindrome

is_palindrome:          # Definition of the is_palindrome label
movzbq (%rdi),%rdx      # Move the byte at the memory address pointed by rdi to rdx and zero extend it to quadword size
movq %rsi,%r8           # Move the value of the second argument (rsi) to r8
cmpq $0,%r8             # Compare the value in r8 with 0
je nxt2                 # If r8 is 0, jump to the label nxt2
movq $0,%rcx            # Initialize the counter rcx to 0
movq $1,%r9             # Initialize a counter r9 to 1
testq %r9,%r8           # Test if r8 is odd by performing a bitwise AND with 1 and setting the zero flag
je even                 # If r8 is even, jump to the label even
testq %r9,%r8           # Test if r8 is odd by performing a bitwise AND with 1 and setting the zero flag
jne odd                 # If r8 is odd, jump to the label odd

odd:                    # Label for odd length strings
movq %r8,%rax           # Copy the length of the string (r8) to rax
shrq $1,%rax            # Shift right by 1 to find the middle index of the string
jmp loop1               # Jump to loop1 to start checking for palindrome

loop1:                  # Loop for odd length strings
cmpq %rcx,%rax          # Compare the current index (rcx) with the middle index (rax)
jl nxt                  # If rax is less than rcx, jump to the label nxt
pushq %rdx              # Push the current character onto the stack
addq $1,%rcx            # Increment rcx to move to the next character
movzbq (%rdi,%rcx,1),%rdx  # Move the next character to rdx
jmp loop1               # Jump back to loop1 to continue checking for palindrome

nxt:                    # Label for moving to the next step
popq %r10               # Pop the character from the stack into r10
jmp next2               # Jump to the next step for further processing

next2:                  # Label for the next step
cmpq %rcx,%r8           # Compare the current index (rcx) with the string length (r8)
jle nxt2                # If r8 becomes less than equal to rcx jump to nxt2
popq %r10               # Pop the character from the stack into r10
cmpq %r10,%rdx          # Compare the character in r10 with the current character in rdx
je bruh                 # If they are equal, jump to the label bruh
cmpq %r10,%rdx          # Compare the character in r10 with the current character in rdx
jne stack_empty         # If they are not equal, jump to the label stack_empty

bruh:                   # Label for reaching the middle of the string with equality in characters
addq $1,%rcx            # Increment rcx to move to the next character
movzbq (%rdi,%rcx,1),%rdx  # Move the byte at the memory address pointed by (rdi + rcx*1) to rdx
jmp next2               # Jump to the next step for further processing

nxt2:                   # Label for moving to the next step
movq $1,%rax            # Set the return value (rax) to 1, indicating a palindrome
ret                     # Return from the function

even:                   # Label for even length strings
movq %r8,%rax           # Copy the length of the string (r8) to rax
shrq $1,%rax            # Shift right by 1 to find the middle index of the string
jmp loop2               # Jump to loop2 to start checking for palindrome

loop2:                  # Loop for even length strings
cmpq %rcx,%rax          # Compare the current index (rcx) with the middle index (rax)
jle next2               # If rax is less than or equal to rcx, jump to the label nxt2
pushq %rdx              # Push the current character onto the stack
addq $1,%rcx            # Increment rcx to move to the next character
movzbq (%rdi,%rcx,1),%rdx  # Move the next character to rdx
jmp loop2               # Jump back to loop2 to continue checking for palindrome

stack_empty:            # Label for emptying the stack
cmpq $1,%rax            # Compare the return value (rax) with 1
jle no                  # If rax is less than or equal to 1, jump to the label no
popq %r10               # Pop the character from the stack into r10
subq $1,%rax            # Decrement rax to update the stack count
jmp stack_empty         # Jump back to stack_empty to continue processing

no:                     # Label for when there's no palindrome
movq $0,%rax            # Set the return value (rax) to 0, indicating no palindrome
ret                     # Return from the function
