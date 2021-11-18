.data
.align 2
# random garbage
queue:
.half 111
.half 200
.byte 14 69 23 197 105 69 28 215 231 224 10 98 138 144 86 88 219 14 41 35 87 144 86 180 63 42 1 232 112 199 23 225 153 97 18 2 81 188 115 27 232 12 24 171 37 33 203 233 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 
max_size: .word 6

.text
.globl main
main:
la $a0, queue
lw $a1, max_size
lw $s0,max_size 
jal init_queue
 la $t0, queue
lhu $t1, 0($t0)
addi $t0, $t0, 4
li $t3, 0
queuePrintLoop:
beq $t3, $t1, endPrint
lw $a0, 0($t0)
li $v0, 1
syscall
li $a0, ' '
li $v0, 11
syscall
lh $a0, 4($t0)
li $v0, 1
syscall
li $a0, ' '
li $v0, 11
syscall
lh $a0, 6($t0)
li $v0, 1
syscall
li $a0, '\n'
li $v0, 11
syscall
addi $t0, $t0, 8
addi $t3, $t3, 1
j queuePrintLoop

endPrint:
# We are late enough in the semester that you can take care of printing
# the results of the function call.

li $v0, 10
syscall

.include "proj4.asm"
