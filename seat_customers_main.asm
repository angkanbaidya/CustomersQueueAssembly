.data
num_admitted: .word 8
budget: .word 20
admitted:
.word 508  # id number
.half 15  # fame
.half 9  # wait_time
.word 678  # id number
.half 5  # fame
.half 9  # wait_time
.word 91  # id number
.half 7  # fame
.half 8  # wait_time
.word 996  # id number
.half 8  # fame
.half 7  # wait_time
.word 819  # id number
.half 11  # fame
.half 5  # wait_time
.word 880  # id number
.half 7  # fame
.half 5  # wait_time
.word 209  # id number
.half 12  # fame
.half 4  # wait_time
.word 975  # id number
.half 8  # fame
.half 2  # wait_time



.text
.globl main
main:
la $a0, admitted
lw $a1, num_admitted
lw $a2, budget
jal seat_customers




# We are late enough in the semester that you can take care of printing
# the results of the function call.

li $v0, 10
syscall

.include "proj4.asm"
