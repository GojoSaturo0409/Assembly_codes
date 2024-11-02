.global wave
wave:
movq %rdi,%r8
subq $1,%r8
movq (%rsi),%r9
movq $0,%rdx
movq $1,%rbx
movq $0,%r10
movq %r8,%r13
subq $1,%r13
jmp outerloop

outerloop:
cmpq %r10,%r8
jle nxt2
jmp loop

loop:
cmpq %rdx,%r8
jle nxt
movq (%rsi,%rdx,8),%r14
movq (%rsi,%rbx,8),%r15
cmpq %r14,%r15
jle switch
addq $1,%rdx
addq $1,%rbx
jmp loop

switch:
movq (%rsi,%rdx,8),%r14
movq (%rsi,%rbx,8),%r15
movq %r15,(%rsi,%rdx,8)
movq %r14,(%rsi,%rbx,8)
addq $1,%rdx
addq $1,%rbx
jmp loop

nxt:
movq $1,%rbx
movq $0,%rdx
addq $1,%r10
jmp outerloop

nxt2:
movq $1,%rbx
movq $0,%rdx
jmp loop2

loop2:
cmpq %rdx,%rdi
jle end
cmpq %rdx,%r8
jle end
movq (%rsi,%rdx,8),%r14
movq (%rsi,%rbx,8),%r15
movq %r15,(%rsi,%rdx,8)
movq %r14,(%rsi,%rbx,8)
addq $2,%rdx
addq $2,%rbx
jmp loop2

end:
ret

