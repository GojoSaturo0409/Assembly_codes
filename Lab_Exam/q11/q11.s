.global left_or_right
left_or_right:
movq (%rsi),%r8
movq %rdi,%r9
subq $1,%r9
movq $0,%r10
movq (%rsi,%r10,8),%r11
movq (%rsi,%r9,8),%r12
movq $0,%r13
movq $0,%rax
# movq $0,%r14
movq %rdi,%rcx
shrq $1,%rcx
movq $0,%rbx
jmp loop

loop:
cmpq $1,%rdi
je end2
cmpq %r10,%rcx
jle prereset
cmpq %r11,%r12
je same
cmpq %r11,%r12
jne diff

same:
# cmpq %r10,%r9
# je nxt2
cmpq $0,%r11
je flip_zero
cmpq $1,%r12
je flip_one

flip_one:
movq $0,(%rsi,%r9,8)
jmp adder

flip_zero:
movq $1,(%rsi,%r10,8)
jmp adder

adder:
cmpq %r13,%rdi
jle nxt2
movq (%rsi,%r13,8),%r8
cmpq $1,%r8
je one_add
cmpq $0,%r8
je zero_add


one_add:
movq %rdi,%r15
subq %r13,%r15
subq $1,%r15
addq %r15,%rax
addq $1,%r13
jmp adder

zero_add:
addq %r13,%rax
addq $1,%r13
jmp adder

diff:
cmpq $0,%r11
je flip_zero1
cmpq $1,%r12
je flip_one1
jmp looper

flip_zero1:
movq $1,(%rsi,%r10,8)
jmp adder2

flip_one1:
movq $0,(%rsi,%r9,8)
jmp adder2

adder2:
cmpq %r13,%rdi
jle nxt3
movq (%rsi,%r13,8),%r8
cmpq $1,%r8
je one_add1
cmpq $0,%r8
je zero_add1

one_add1:
movq %rdi,%r15
subq %r13,%r15
subq $1,%r15
addq %r15,%rax
addq $1,%r13
jmp adder2

looper:
addq $1,%r10
subq $1,%r9
movq $0,%r13
cmpq %r10,%rcx
jle prereset
movq (%rsi,%r10,8),%r11
movq (%rsi,%r9,8),%r12
movq $0,%rax
jmp loop

zero_add1:
addq %r13,%rax
addq $1,%r13
jmp adder2

nxt3:
cmpq %rbx,%rdi
je end
movq %rax,(%rdx,%rbx,8)
addq $1,%rbx
movq $0,%r13
movq (%rsi,%r10,8),%r11
movq (%rsi,%r9,8),%r12
movq $0,%rax
jmp loop

nxt2:
cmpq %rbx,%rdi
je end
movq %rax,(%rdx,%rbx,8)
addq $1,%rbx
addq $1,%r10
subq $1,%r9
movq $0,%r13
cmpq %r10,%rcx
jle prereset
movq (%rsi,%r10,8),%r11
movq (%rsi,%r9,8),%r12
movq $0,%rax
jmp loop

prereset:
cmpq $0,%rbx
je adder
subq $1,%rbx
movq (%rdx,%rbx,8),%rax
addq $1,%rbx
jmp reset

reset:
cmpq %rbx,%rdi
jle end
movq %rax,(%rdx,%rbx,8)
addq $1,%rbx
jmp reset

end:
ret

end2:
movq $0,(%rdx,%rbx,8)
ret
