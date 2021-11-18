.data
queue:
.align 2
.half 0  # size
.half 5  # max_size
# index 0
.word 0  # id number
.half 0  # fame
.half 0  # wait_time
# index 1
.word 0  # id number
.half 0  # fame
.half 0  # wait_time
# index 2
.word 0  # id number
.half 0  # fame
.half 0  # wait_time
# index 3
.word 0  # id number
.half 0  # fame
.half 0  # wait_time
# index 4
.word 0  # id number
.half 0  # fame
.half 0  # wait_time
dequeued_customer:  # garbage
.word 346  # id number
.half 568  # fame
.half 12  # wait_time





.text
.globl main
main:
la $a0, queue
la $a1, dequeued_customer
jal dequeue

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
exit:
li $v0, 10
syscall

.include "proj4.asm"
