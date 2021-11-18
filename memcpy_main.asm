.data
.align 2
n: .word 7
src: .asciiz "ABCDEFG"
dest: .asciiz "xxxxxxxxx"

.text
.globl main
main:
la $a0, src
la $a1, dest
lw $a2, n
jal memcpy
li $v0,4
la $a0,dest
syscall





# Write your own code to print the return value and the contents of the board.
exit:
# We are late enough in the semester that you can take care of printing
# the results of the function call.

li $v0, 10
syscall

.include "proj4.asm"
