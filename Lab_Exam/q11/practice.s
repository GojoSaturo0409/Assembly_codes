.global leftright

leftright:
movq %rdi,%r8
shrq $1,%r8
movq $0,%r9 # starting
movq %rdi,%r10
subq $1,%r10 # end
movq (%rsi,%r9,8),%r11
movq (%rsi,%r10,8),%r12
movq $0,%r13
movq $0,%rax
movq $0,%rbx
cmpq $1,%rdi
je end2
jmp loop

loop:
cmpq %r9,%rcx
jle prereset
cmpq %r11,%r12
je same
cmpq %r11,%r12
jne diff

same:
cmpq $0,%r11
je flip_zero
cmpq $1,%r12
je flip_one

flip_zero:
movq $1,(%rsi,%r9,8)
jmp adder

flip_one:
movq $0,(%rsi,%r10,8)
jmp adder

adder:
cmpq %r13,%rdi
jle nxt
cmpq $0,(%rsi,%r13,8)
je zero_add
cmpq $1,(%rsi,%r13,8)
je one_add

zero_add:
addq %r13,%rax
addq $1,%r13
jmp adder

one_add:
addq %rdi,%rax
subq %r13,%rax
subq $1,%rax
addq $1,%r13
jmp adder

diff:
cmpq $0,%r11
je flip_zero1
cmpq $1,%r12
je flip_one1
jmp looper

flip_zero1:
movq $1,(%rsi,%r9,8)
jmp adder2

flip_one1:
movq $1,(%rsi,%r10,8)
jmp adder2

adder2:
cmpq %r13,%rdi
jle nxt2
cmpq $0,(%rsi,%r13,8)
je zero_add1
cmpq $1,(%rsi,%r13,8)
je one_add1

zero_add1:
addq %r13,%rax
addq $1,%r13
jmp adder2

one_add1:
addq %rdi,%rax
subq %r13,%rax
subq $1,%rax
addq $1,%r13
jmp adder2

looper:
addq $1,%r9
subq $1,%r10
movq (%rsi,%r9,8),%r11
movq (%rsi,%r10,8),%r12
cmpq %r9,%r8
jle prereset
jmp loop


nxt:
cmpq %rbx,%rdi
jle end
movq %rax,(%rdx,%rbx,8)
addq $1,%rbx
addq $1,%r9
subq $1,%r10
movq $0,%rax
movq $0,%r13
cmpq %r9,%r8
jle prereset
movq (%rsi,%r9,8),%r11
movq (%rsi,%r10,8),%r12
jmp loop


nxt2:
cmpq %rbx,%rdi
jle end
movq %rax,(%rdx,%rbx,8)
addq $1,%rbx
movq $0,%rax
movq $0,%r13
cmpq %r9,%r8
jle prereset
movq (%rsi,%r9,8),%r11
movq (%rsi,%r10,8),%r12
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