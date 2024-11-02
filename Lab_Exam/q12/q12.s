.global factorial_sum

factorial_sum:
movq %rdi,%r8
movq %r8,%rax
movq $10,%rcx
movq $1,%r11
movq $0,%r9
movq $0,%r10
jmp loop

loop:
cqto
idivq %rcx
movq %rdx,%rbx
jmp fact_calc

fact_calc:
cmpq $0,%rbx
je nxt
imulq %rbx,%r11
subq $1,%rbx
jmp fact_calc

nxt:
addq %r11,%r9
addq $1,%r10
movq $1,%r11
cmpq $0,%rax
jle end
jmp loop


end:
cmpq %r9,%rdi
je move1
jmp end2

move1:
movq $1,%rax
ret

end2:
movq $0,%rax
ret