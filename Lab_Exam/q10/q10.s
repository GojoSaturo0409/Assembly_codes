.global odd_swap
odd_swap:
movq (%rsi),%rdx
movq $0,%r8
movq $1,%r9
movq $0,%r10
movq $1,%r11
movq %rdi,%r12
subq $1,%r12
movq (%rsi,%r9,8),%rbx
jmp loop

loop:
cmpq %r8,%r12
jle end
cmpq %r9,%rdi
jle nxt
addq %rdx,%r10
addq %rbx,%r10
testq %r11,%r10
jne preswitch
addq $1,%r9
movq (%rsi,%r8,8),%rdx
movq (%rsi,%r9,8),%rbx
movq $0,%r10
jmp loop

preswitch:
cmpq %rdx,%rbx
jle switch
addq $1,%r9
movq (%rsi,%r8,8),%rdx
movq (%rsi,%r9,8),%rbx
movq $0,%r10
jmp loop

switch:
movq (%rsi,%r8,8),%r14
movq (%rsi,%r9,8),%r15
movq %r14,(%rsi,%r9,8)
movq %r15,(%rsi,%r8,8)
addq $1,%r9
movq (%rsi,%r8,8),%rdx
movq (%rsi,%r9,8),%rbx
movq $0,%r10
jmp loop

nxt:
addq $1,%r8
movq $0,%r9
addq %r8,%r9
addq $1,%r9
movq $0,%r10
movq (%rsi,%r8,8),%rdx
movq (%rsi,%r9,8),%rbx
jmp loop

end:
ret
