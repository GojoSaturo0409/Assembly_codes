.global gcd_eval
gcd_eval:
movq %rdi,%r8
movq %rsi,%r9
movq $1,%rax
movq $1,%r10
movq $1,%r12 # result storer
cmpq $0,%r8
je sp1
cmpq $0,%r9
je sp3
cmpq %r8,%r9
jle mover1
cmpq %r9,%r8
jle mover2
mover1:
movq %r9,%r11
jmp loop
mover2:
movq %r8,%r11
jmp loop
loop:
cmpq %r10,%rsi
jl end
movq %r8,%rax
cqto
idivq %r10
cmpq $0,%rdx
je loop2
addq $1,%r10
jmp loop
loop2:
movq %r9,%rax
cqto
idivq %r10
cmpq $0,%rdx
je loop3
addq $1,%r10
jmp loop
loop3:
movq %r10,%r12
addq $1,%r10
jmp loop
sp1:
cmpq $0,%r9
je sp2
movq %r9,%rax
ret
sp2:
movq $0,%rax
ret
sp3:
movq %r8,%rax
ret
end:
movq %r12,%rax
ret