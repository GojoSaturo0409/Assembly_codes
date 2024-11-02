.global max_sum_b
max_sum_b:
movq (%rdx),%rcx
movq %rsi,%r13
movq $-999999999999,%r8 # storing the final result
movq %rdi,%r9
movq $0,%r10
movq $0,%r11

adder:
cmpq %r10,%rsi
jle loop2
addq %rcx,%r11
addq $1,%r10
movq (%rdx,%r10,8),%rcx
jmp adder

loop2:
cmpq %r11,%r8
jle mover
# movq $0,%r10
# movq $0,%r11
# subq $1,%r9
jmp preloop

mover:
movq %r11,%r8
jmp preloop

preloop:
movq $0,%r10
movq $0,%r11
movq $0,%r12
subq $1,%r9
movq (%rdx),%rcx
movq (%rdx,%r9,8),%r12
movq %r9,%r14
subq $1,%r13
cmpq $-1,%r13
je end
jmp loop3

loop3:
cmpq %r10,%r13
jle nxt
addq %rcx,%r11
addq $1,%r10
movq (%rdx,%r10,8),%rcx
jmp loop3

nxt:
cmpq %r14,%rdi
jle nxt2
addq %r12,%r11
addq $1,%r14
movq (%rdx,%r14,8),%r12
jmp nxt

nxt2:
cmpq %r11,%r8
jle mover
jmp preloop

end:
movq %r8,%rax
ret