.global missing_pos_num
missing_pos_num:
movq %rdi,%r8
movq $1,%rax
movq $0,%r10
movq (%rsi),%r9

loop:
cmpq %r10,%r8
jle nxt
cmpq %rax,%r9
je nxt2
addq $1,%r10
movq (%rsi,%r10,8),%r9
jmp loop

nxt:
ret

nxt2:
movq $0,%r10
movq (%rsi),%r9
addq $1,%rax
jmp loop