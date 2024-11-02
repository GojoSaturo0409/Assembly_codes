.global FizzBuzz

FizzBuzz:
movq (%rsi),%r8
movq $0,%r9
movq $0,%r10
movq $3,%rcx
movq $5,%rbx
movq $15,%r11
jmp looper

looper:
addq $1,%r9
movq %r9,%rax
cqto
idivq %r11
cmpq $0,%rdx
je fibu 
movq %r9,%rax
cqto
idivq %rcx
cmpq $0,%rdx
je fizz 
movq %r9,%rax
cqto
idivq %rbx
cmpq $0,%rdx
je buzz 
movq %r9,(%rsi,%r10,8)
addq $1,%r10
cmpq %r9,%rdi
je end
jmp looper

fizz:
movq $-1,(%rsi,%r10,8)
addq $1,%r10
cmpq %r9,%rdi
je end
jmp looper

buzz:
movq $-2,(%rsi,%r10,8)
addq $1,%r10
cmpq %r9,%rdi
je end
jmp looper

fibu:
movq $-3,(%rsi,%r10,8)
addq $1,%r10
cmpq %r9,%rdi
je end
jmp looper

end:
ret
