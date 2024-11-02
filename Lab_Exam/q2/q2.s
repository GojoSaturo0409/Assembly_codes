.global odd_checker

odd_checker:
movq %rdi,%rax
movq $2,%r9
movq $0 ,%rbx
jmp loop
loop:
cmpq $0,%rax
je end
cqto
idivq %r9
cmpq $1,%rdx
je adder
jmp loop

adder:
addq $1,%rbx
jmp loop

end:
movq %rbx,%rax
cqto
idivq %r9
movq %rdx,%rax
ret
