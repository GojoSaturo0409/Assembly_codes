.global calculator
calculator:
movq %rdi,%r8
movq %rsi,%r9
movq %rdx,%r10
cmpq $1,%r10
je adder
cmpq $2,%r10
je subtractor
cmpq $3,%r10
je divider
cmpq $4,%r10
je exponent
cmpq $5,%r10
je mod

adder:
movq $0,%rax
addq %r8,%rax
addq %r9,%rax
jmp end

subtractor:
movq %r8,%rax
subq %r9,%rax
jmp end

divider:
movq %r8,%rax
cqto
idivq %r9
jmp end

exponent:
movq $1,%rax
movq $1,%r11
loop:
cmpq %r11,%r9
jl end
imulq %r8,%rax
addq $1,%r11
jmp loop

# check this
mod:
movq %r8,%rax
cqto
idivq %r9
movq %rdx,%rax
jmp end

end:
ret