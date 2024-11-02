.global pal_check

pal_check:
movq %rdi,%r8
movq %r8,%rax
movq $10,%r10
movq $0,%rbx
pushq %rbp
movq %rsp,%rbp
jmp loop

loop:
cmpq $0,%rax
je nxt
cqto
idivq %r10
addq $1,%rbx
pushq %rdx
jmp loop

nxt:
movq $0,%r9
movq $1,%r11
jmp loop2

loop2:
cmpq $0,%rbx
je nxt2
popq %r12
subq $1,%rbx
imulq %r11,%r12
addq %r12,%r9
imulq $10,%r11
jmp loop2

nxt2:
cmpq %r9,%rdi
je end2
jmp end

end2:
movq $1,%rax
movq %rbp,%rsp
popq %rbp
ret

end:
movq $0,%rax
movq %rbp,%rsp
popq %rbp
ret


