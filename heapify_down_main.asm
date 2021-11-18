.data
queue:
.align 2
.half 10  # size
.half 12  # max_size
# index 0
.word 250  # id number
.half 859  # fame
.half 16  # wait_time
# index 1
.word 713  # id number
.half 562  # fame
.half 16  # wait_time
# index 2
.word 285  # id number
.half 414  # fame
.half 22  # wait_time
# index 3
.word 566  # id number
.half 262  # fame
.half 29  # wait_time
# index 4
.word 566  # id number
.half 166  # fame
.half 7  # wait_time
# index 5
.word 889  # id number
.half 407  # fame
.half 17  # wait_time
# index 6
.word 992  # id number
.half 475  # fame
.half 23  # wait_time
# index 7
.word 841  # id number
.half 237  # fame
.half 26  # wait_time
# index 8
.word 677  # id number
.half 369  # fame
.half 12  # wait_time
# index 9
.word 645  # id number
.half 351  # fame
.half 18  # wait_time
# index 10
.word 0  # id number
.half 0  # fame
.half 0  # wait_time
# index 11
.word 0  # id number
.half 0  # fame
.half 0  # wait_time
index: .word 0




.text
.globl main
main:
la $a0, queue
lw $a1, index
jal heapify_down
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
