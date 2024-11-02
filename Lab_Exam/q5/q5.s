.global sorting
sorting:
movq (%rsi),%r8
movq $0,%r9
movq $0,%r10
movq $0,%r11
jmp loop

loop:
cmpq %r11,%rdi
je preloop2
cmpq $0,%r8
je add1
cmpq $1,%r8
je add2

add1:
addq $1,%r9
addq $1,%r11
movq (%rsi,%r11,8),%r8
jmp loop

add2:
addq $1,%r10
addq $1,%r11
movq (%rsi,%r11,8),%r8
jmp loop

preloop2:
movq $0,%r11
jmp loop2

loop2:
cmpq $0,%r9
je loop3
movq $0,(%rsi,%r11,8)
subq $1,%r9
addq $1,%r11
jmp loop2

loop3:
cmpq $0,%r10
je end
movq $1,(%rsi,%r11,8)
subq $1,%r10
addq $1,%r11
jmp loop3

end:
ret