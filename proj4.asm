# Angkan Baidya
# abaidya
# 112309655

#################### DO NOT CREATE A .data SECTION ####################
#################### DO NOT CREATE A .data SECTION ####################
#################### DO NOT CREATE A .data SECTION ####################

.text

# Part I
compare_to:
addi $sp, $sp, -28 # Makes space on stack for one register, the ra
	sw $ra, 0($sp) # Stores $ra register in the stack
	sw $s0, 4($sp) # Stores the caller's s0
	sw $s1, 8($sp) # Stores the caller's s1
	sw $s2, 12($sp) # Stores the callers s2
	sw $s3, 16($sp)
	sw $s4, 20($sp)
	sw $s5, 24($sp)
li $t0,0 #loop counter for inner 
li $t1,0 #random for inner 
li $t2,0 #random for inner 
li $t3,0
li $t4,0
li $t5,0
li $t6,0
li $t7,0
li $t8,0
li $t9,0 
move $s4,$a0
move $s5,$a1
lhu $s0, 4($s4) #load fame c1
lhu $s1, 6($s4) #load wait time c1
lhu $s2, 4($s5) #load fame c2
lhu $s3, 6($s5) #load wait time c2
li $t9,10 #10 for multiplication
li $t0,0 #hold c1 final number
mul $t0,$s1,$t9
add $t0,$t0,$s0
li $t1,0 #hold c2 final number
mul $t1,$s3,$t9 #c2 wait time * 10 
add $t1, $t1,$s2 #t1 = c2.fame + 10
blt $t0,$t1,negative
bgt $t0,$t1,one
beq $t0,$t1,zero

zero:
blt $s0,$s2,negative
bgt $s0,$s2,one
li $v0,0
lw $ra, 0($sp) # Stores $ra register in the stack
	lw $s0, 4($sp) # Stores the caller's s0
	lw $s1, 8($sp) # Stores the caller's s1
	lw $s2, 12($sp) # Stores the callers s2
	lw $s3, 16($sp)
	lw $s4, 20($sp)
	lw $s5, 24($sp)
	addi $sp, $sp, 28 # Makes space on stack for one register, the ra
jr $ra

one:
li $v0,1
lw $ra, 0($sp) # Stores $ra register in the stack
	lw $s0, 4($sp) # Stores the caller's s0
	lw $s1, 8($sp) # Stores the caller's s1
	lw $s2, 12($sp) # Stores the callers s2
	lw $s3, 16($sp)
	lw $s4, 20($sp)
	lw $s5, 24($sp)
	addi $sp, $sp, 28 # Makes space on stack for one register, the ra

jr $ra


negative:
li $v0,-1
lw $ra, 0($sp) # Stores $ra register in the stack
	lw $s0, 4($sp) # Stores the caller's s0
	lw $s1, 8($sp) # Stores the caller's s1
	lw $s2, 12($sp) # Stores the callers s2
	lw $s3, 16($sp)
	lw $s4, 20($sp)
	lw $s5, 24($sp)
	addi $sp, $sp, 28 # Makes space on stack for one register, the ra
	
jr $ra

# Part II
init_queue:
addi $sp, $sp, -8 # Makes space on stack for one register, the ra
	sw $ra, 0($sp) # Stores $ra register in the stack
	sw $s0, 4($sp) # Stores the caller's s0
li $t0, 0 #loop counter for inner 
li $t1,0 #random for inner 
li $t2,0 #random for inner 
li $t3,0
li $t4,0
li $t5,0
li $t6,0
li $t7,0
li $t8,0
li $t9,0 
	
move $s0,$a1 #store max size
move $t9,$s0 #store 
blez $s0,invalid
li $t1,0 #increment counter
li $t8,8
mul $t9,$t9,$t8 #multiply by 8 
addi $t9,$t9,1
iteratequeue:
beq $t1,$t9,valid #if zeroed out succesfully, then return max size
sb $zero,4($a0) #store in first of queue
addi $a0,$a0,1 #incre ment by 1
addi $t1,$t1,1 
j iteratequeue

valid:
move $v0,$s0 #return max size
lw $ra, 0($sp) # Stores $ra register in the stack
	lw $s0, 4($sp) # Stores the caller's s0
	addi $sp, $sp, 8 # Makes space on stack for one register, the ra
	jr $ra 
invalid:
li $v0,-1
lw $ra, 0($sp) # Stores $ra register in the stack
	lw $s0, 4($sp) # Stores the caller's s0
	addi $sp, $sp, 8 # Makes space on stack for one register, the ra
	jr $ra

# Part III
memcpy:
addi $sp, $sp, -16 # Makes space on stack for one register, the ra
	sw $ra, 0($sp) # Stores $ra register in the stack
	sw $s0, 4($sp) # Stores the caller's s0
	sw $s1, 8($sp) # Stores the caller's s1
	sw $s2, 12($sp) # Stores the callers s2
li $t0, 0 #loop counter for inner 
li $t1,0 #random for inner 
li $t2,0 #random for inner 
li $t3,0
li $t4,0
li $t5,0
li $t6,0
li $t7,0
li $t8,0
li $t9,0 
move $s0,$a0 #move src
move $s1,$a1 #move destination
move $s2,$a2 #move n 
blez $s2,invalid3 #less than or equal to 0 
li $t9,0 

memorycopy:
beq $t9,$s2,valid3 #if you reach max number of bytes to copy, done 
lb $t0,0($s0) #first byte of src
sb $t0,0($s1) #first byte of destination
addi $s0,$s0,1 #increment
addi $s1,$s1,1  #increment
addi $t9,$t9,1
j memorycopy

valid3:
move $v0,$s2 #return n 
lw $ra, 0($sp) # Stores $ra register in the stack
	lw $s0, 4($sp) # Stores the caller's s0
	lw $s1, 8($sp) # Stores the caller's s1
	lw $s2, 12($sp) # Stores the callers s2
	addi $sp, $sp, 16 # Makes space on stack for one register, the ra
	jr $ra
jr $ra


invalid3:
li $v0,-1
lw $ra, 0($sp) # Stores $ra register in the stack
	lw $s0, 4($sp) # Stores the caller's s0
	lw $s1, 8($sp) # Stores the caller's s1
	lw $s2, 12($sp) # Stores the callers s2
	addi $sp, $sp, 16 # Makes space on stack for one register, the ra
	jr $ra
jr $ra

# Part IV
contains:
addi $sp, $sp, -16 # Makes space on stack for one register, the ra
	sw $ra, 0($sp) # Stores $ra register in the stack
	sw $s0, 4($sp) # Stores the caller's s0
	sw $s1, 8($sp) # Stores the caller's s1
	sw $s2, 12($sp) # Stores the callers s2
li $t0, 0 #loop counter for inner 
li $t1,0 #random for inner 
li $t2,0 #random for inner 
li $t3,0
li $t4,0
li $t5,0
li $t6,0
li $t7,0
li $t8,0
li $t9,0 
move $s0,$a0 #move queue
move $s1,$a1 #move ID number
li $t8,0 #counter
li $t6,1 #2nd counter
li $s2,1 #3rd counter for level 
lhu $t7,0($a0)
getid:
beq $t8,$t6,multiply
getidcontinue:
beq $t8,$t7,invalid4 #if t8 reaches size then done looking, cant find
li $t9,0 #instantiate
lw $t9,4($a0) #get ID
beq $t9,$s1,valid4 #if customer id is equal to id wanted done
addi $a0,$a0,8 #move to next block
addi $t8,$t8,1 #increment
j getid

multiply:
li $t5,3
mul $t6,$t6,$t5 #multiply by 3
addi $t6,$t6,4 #add 4 
addi $s2,$s2,1 #increment for level 
j getidcontinue

valid4:
move $v0,$s2 #return return index 
lw $ra, 0($sp) # Stores $ra register in the stack
	lw $s0, 4($sp) # Stores the caller's s0
	lw $s1, 8($sp) # Stores the caller's s1
	lw $s2, 12($sp) # Stores the callers s2
	addi $sp, $sp, 16 # Makes space on stack for one register, the ra
	jr $ra

invalid4:
li $v0,-1
lw $ra, 0($sp) # Stores $ra register in the stack
	lw $s0, 4($sp) # Stores the caller's s0
	lw $s1, 8($sp) # Stores the caller's s1
	lw $s2, 12($sp) # Stores the callers s2
	addi $sp, $sp, 16 # Makes space on stack for one register, the ra
	jr $ra



# Part V
enqueue:
addi $sp, $sp, -28 # Makes space on stack for one register, the ra
	sw $ra, 0($sp) # Stores $ra register in the stack
	sw $s0, 4($sp) # Stores the caller's s0
	sw $s1, 8($sp) # Stores the caller's s1
	sw $s2, 12($sp) # Stores the callers s2
	sw $s3, 16($sp) #size keep 
	sw $s4, 20($sp) #integer check
	sw $s5, 24($sp) #check for already done
	

li $t0, 0 #loop counter for inner 
li $t1,0 #random for inner 
li $t2,0 #random for inner 
li $t3,0
li $t4,0
li $t5,0
li $t6,0
li $t7,0
li $t8,0
li $t9,0 
li $s5,0

move $s0, $a0 # move queue
move $s1, $a1 #move customer
lw $s2, 0($s1) #ID of customer


#check if id already inside queue. 
move $a1,$s2 #move id 
jal contains
li $t9,-1
move $t8,$v0 #return into t8 
bne $t8,$t9,invalid5 #if anything but -1 means there is already an ID

#check if queue is full
li $t9,0
lhu $t9,0($s0) #get size
lhu $t8,2($s0) #get max size
beq $t9,$t8,invalid5 

#copy to size 
move $a0,$s1 #load address of customer
li $s3,0
lhu $s3,0($s0) #get size 
li $t8,8
mul $t4,$s3,$t8 #multiplyby 8
addi $t4,$t4,4 #add 4 
add $a1,$s0,$t4 #increment queue to size
 #$a1, 0($s0) #load a1 to the address of where to store
li $a2,8 #8 bits as max size
jal memcpy #call memcpy 

compare:
#compare
li $t8,8
mul $t4,$s3,$t8 #multiplyby 8
addi $t4,$t4,4 #add 4 
add $a0,$s0,$t4 #increment queue to size
#secondcustomer
li $s4,0
addi $s4,$s3,-1
li $t8,3
div $s4,$t8
mflo $s4 # value before 
li $t8,8
mul $t4,$s4,$t8 #multiplyby 8
addi $t4,$t4,4 #add 4 
add $a1,$s0,$t4 #increment queue to size
jal compare_to
li $t6,-1
beq $v0,$zero,invalid5
beq $v0,$t6,invalid5

#swap parent to stack
move $a0,$s0 #reimplent queue
li $t8,8
mul $t4,$s4,$t8 #multiplyby 8
addi $t4,$t4,4 #add 4 
add $a0,$s0,$t4 #increment queue to size
addi $sp,$sp,-8
move $a1,$sp 
li $a2,8
jal memcpy 

#getchild again
li $t8,8
mul $t4,$s3,$t8 #multiplyby 8
addi $t4,$t4,4 #add 4 
add $a0,$s0,$t4 #increment queue to size
#getparent
li $t8,8
mul $t4,$s4,$t8 #multiplyby 8
addi $t4,$t4,4 #add 4 
add $a1,$s0,$t4 #increment queue to size
li $a2,8 
jal memcpy

#get parent
move $a0,$sp

#getchild 
li $t8,8
mul $t4,$s3,$t8 #multiplyby 8
addi $t4,$t4,4 #add 4 
add $a1,$s0,$t4 #increment queue to size
li $a2,8
jal memcpy

addi $sp,$sp,8 #restore stack
lhu $t9,0($s0) #get size 
addi $t9,$t9,1 
sh $t9,0($s0) #increase size
addi $s5,$s5,1

move $t9,$s3
move $s3,$s4
move $s4,$t9
j compare 


valid5: 
li $v0,1
lhu $t9,0($s0) #get size
add $v1,$t9,$zero
lw $ra, 0($sp) # Stores $ra register in the stack
	lw $s0, 4($sp) # Stores the caller's s0
	lw $s1, 8($sp) # Stores the caller's s1
	lw $s2, 12($sp) # Stores the callers s2
	lw $s3, 16($sp)
	lw $s4, 20($sp)
	lw $s5, 24($sp)
	addi $sp, $sp, 28 # Makes space on stack for one register, the ra
	jr $ra


invalid5:
bnez $s5,valid5
li $v0,-1
lhu $t9,0($s0) #get size
add $v1,$t9,$zero
lw $ra, 0($sp) # Stores $ra register in the stack
	lw $s0, 4($sp) # Stores the caller's s0
	lw $s1, 8($sp) # Stores the caller's s1
	lw $s2, 12($sp) # Stores the callers s2
	lw $s3, 16($sp)
	lw $s4, 20($sp)
	lw $s5, 24($sp)
	addi $sp, $sp, 28 # Makes space on stack for one register, the ra
	jr $ra




# Part VI
heapify_down:
addi $sp, $sp, -36 # Makes space on stack for one register, the ra
	sw $ra, 0($sp) # Stores $ra register in the stack
	sw $s0, 4($sp) # Stores the caller's s0
	sw $s1, 8($sp) # Stores the caller's s1
	sw $s2, 12($sp) # Stores the callers s2
	sw $s3, 16($sp) #size keep 
	sw $s4, 20($sp) #integer check
	sw $s5, 24($sp) #check for already done
	sw $s6, 28($sp) 
	sw $s7, 32($sp) 
li $t0, 0 #loop counter for inner 
li $t1,0 #random for inner 
li $t2,0 #random for inner 
li $t3,0
li $t4,0
li $t5,0
li $t6,0
li $t7,0
li $t8,0
li $t9,0 
move $s0, $a0 # move queue
move $s1, $a1 #move index
lhu $s6,0($s0) #get size 
li $s7,0 #counter 


#initial check
bltz $s1,invalid6

ifcondition:
bge $s1,$s6,invalid6
#left
li $t9,3
mul $s2,$s1,$t9
addi $s2,$s2,1 #left
#mid
li $t9,3
mul $s3,$s1,$t9
addi $s3,$s3,2 #mid
#right
li $t9,3
mul $s4,$s1,$t9
addi $s4,$s4,3 #right

move $s5,$s1 #largest

bge  $s2,$s6,mid #if left < size
#multiplcation to get A[Left]
li $t8,8
mul $t9,$s2,$t8 #Index*8
addi $t9,$t9,4 #Index + 4 
add $a0,$s0,$t9 #increment queue to A[Index] 
#multiplcation to get A[Largest]
li $t8,8
mul $t7,$s5,$t8 #Largest * 8
addi $t7,$t7,4 #Largest + 4 
add $a1,$s0,$t7 #Increment queue to A[Largest] 
jal compare_to
li $t8,1
beq $v0,$t8,changelargest


mid:
bge $s3,$s6,right #if mid > size, go next
#multiplcation to get A[mid]
li $t8,8
mul $t9,$s3,$t8
addi $t9,$t9,4
add $a0,$s0,$t9 #increment queue to A[mid]
#Multipcation to get A[largest] 
li $t8,8
mul $t7,$s5,$t8 #Largest * 8
addi $t7,$t7,4 #Largest + 4 
add $a1,$s0,$t7 #Increment queue to A[Largest] 
jal compare_to
li $t8,1
beq $v0,$t8,changelargestmid


right: 
bge $s4,$s6,convert #if mid > size, break 
#multiplication to get A[Right]
li $t8,8 
mul $t9,$s4,$t8
addi $t9,$t9,4
add $a0,$s0,$t9 #increment queue A[Right] 
#Multipcation to get A[largest] 
li $t8,8
mul $t7,$s5,$t8 #Largest * 8
addi $t7,$t7,4 #Largest + 4 
add $a1,$s0,$t7 #Increment queue to A[Largest] 
jal compare_to
li $t8,1
beq $v0,$t8,changelargestright

convert:
beq $s5,$s1,returnswap # if largest  = index done 
#put index on stack.
move $a0,$s0 #reimplent queue
li $t8,8
mul $t4,$s1,$t8 #multiply index by 8 
addi $t4,$t4,4 #add 4 
add $a0,$s0,$t4 #increment queue to index 
addi $sp,$sp,-8
move $a1,$sp 
li $a2,8
jal memcpy #copy index onto stack. 

#swap largest with index src
li $t8,8
mul $t7,$s5,$t8 #Largest * 8
addi $t7,$t7,4 #Largest + 4 
add $a0,$s0,$t7 #Increment queue to A[Largest] 

#destination
li $t8,8
mul $t7,$s1,$t8 #Largest * 8
addi $t7,$t7,4 #Largest + 4 
add $a1,$s0,$t7 #Increment queue to A[Largest] 
li $a2,8
jal memcpy #swapped

#put index into largest
move $a0,$sp #index
#get largest 
li $t8,8
mul $t7,$s5,$t8 #Largest * 8
addi $t7,$t7,4 #Largest + 4 
add $a1,$s0,$t7 #Increment queue to A[Largest] 
li $a2,8
jal memcpy 

move $s1,$s5 #index = largest
addi $sp,$sp,8 #put back stack 
addi $s7,$s7,1 #increment for swap 
j ifcondition #go back to keep checking 


changelargestright:
move $s5,$s4 #largest = right
j convert 

changelargest:
move $s5,$s2 #largest = left 
j mid

returnswap:
addi $v0,$s7,0
lw $ra, 0($sp) # Stores $ra register in the stack
	lw $s0, 4($sp) # Stores the caller's s0
	lw $s1, 8($sp) # Stores the caller's s1
	lw $s2, 12($sp) # Stores the callers s2
	lw $s3, 16($sp)
	lw $s4, 20($sp)
	lw $s5, 24($sp)
	lw $s6, 28($sp)
	lw $s7, 32($sp)
	addi $sp, $sp, 36 # Makes space on stack for one register, the ra
	jr $ra


invalid6:
li $v0,-1
lw $ra, 0($sp) # Stores $ra register in the stack
	lw $s0, 4($sp) # Stores the caller's s0
	lw $s1, 8($sp) # Stores the caller's s1
	lw $s2, 12($sp) # Stores the callers s2
	lw $s3, 16($sp)
	lw $s4, 20($sp)
	lw $s5, 24($sp)
	lw $s6, 28($sp)
	lw $s7, 32($sp)
	addi $sp, $sp, 36 # Makes space on stack for one register, the ra
	jr $ra



changelargestmid:
move $s5,$s3 #largest = mid
j right



# Part VII
dequeue:
addi $sp, $sp, -16 # Makes space on stack for one register, the ra
	sw $ra, 0($sp) # Stores $ra register in the stack
	sw $s0, 4($sp) # Stores the caller's s0
	sw $s1, 8($sp) # Stores the caller's s1
	sw $s2, 12($sp) # Stores the callers s2
li $t0, 0 #loop counter for inner 
li $t1,0 #random for inner 
li $t2,0 #random for inner 
li $t3,0
li $t4,0
li $t5,0
li $t6,0
li $t7,0
li $t8,0
li $t9,0 
move $s0,$a0 #regular queue
move $s1,$a1 #dequeued custoemr 
lhu $s2,0($s0) #get size
beqz $s2,invalid7 #if queue is empty then -1

#get to customers[0] 
li $t9,4
add $a0,$s0,$t9 #incrmeent to the address and set to a0 
move $a1,$s1 #a1 is the customer queue
li $a2,8
jal memcpy

#copy at customers 1 to customer 0
li $t8,8 
addi $t9,$s2,-1
mul $t9,$t9,$t8
addi $t9,$t9,4 
add $a0,$s0,$t9  #increment to it
#copy to 0
li $t7,4
add $a1,$s0,$t7 #incrmeent to the address and set to a0 
li $a2,8
jal memcpy 

addi $s2,$s2,-1 #decrease size by 1
sh $s2,0($s0) #get size 
#heapify
move $a0,$s0 #queue
li $a1,0 #index 0 
jal heapify_down

addi $v0,$s2,0 #return size
lw $ra, 0($sp) # Stores $ra register in the stack
	lw $s0, 4($sp) # Stores the caller's s0
	lw $s1, 8($sp) # Stores the caller's s1
	lw $s2, 12($sp) # Stores the callers s2
	addi $sp, $sp, 16 # Makes space on stack for one register, the ra
	jr $ra
	
	




invalid7:
li $v0,-1 
lw $ra, 0($sp) # Stores $ra register in the stack
	lw $s0, 4($sp) # Stores the caller's s0
	lw $s1, 8($sp) # Stores the caller's s1
	lw $s2, 12($sp) # Stores the callers s2
	addi $sp, $sp, 16 # Makes space on stack for one register, the ra
	jr $ra
	
	
# Part VIII
build_heap:
addi $sp, $sp, -20 # Makes space on stack for one register, the ra
	sw $ra, 0($sp) # Stores $ra register in the stack
	sw $s0, 4($sp) # Stores the caller's s0
	sw $s1, 8($sp) # Stores the caller's s1
	sw $s2, 12($sp) # Stores the callers s2
	sw $s4, 16($sp) #integer check
li $t0, 0 #loop counter for inner 
li $t1,0 #random for inner 
li $t2,0 #random for inner 
li $t3,0
li $t4,0
li $t5,0
li $t6,0
li $t7,0
li $t8,0
li $t9,0 
	
move $s0,$a0 #queue
li $s2,0 #res
lhu $s1,0($s0) #get size
beqz $s1,invalid8 #if size == 0 then return 0 

#index
addi $t9,$s1,-1 #index = size - 1
li $t8,3
div $t9,$t8
mflo $s4 #size / 3 index


#loop
forloop:
bltz $s4,returnres #for i index to 0 
move $a0,$s0 #a0 for queue
move $a1,$s4 #a1 for index
jal heapify_down
add $s2,$s2,$v0 #res +- result
addi $s4,$s4,-1
j forloop #go back 

returnres:
add $v0,$s2,$zero
lw $ra, 0($sp) # Stores $ra register in the stack
	lw $s0, 4($sp) # Stores the caller's s0
	lw $s1, 8($sp) # Stores the caller's s1
	lw $s2, 12($sp) # Stores the callers s2
	lw $s4, 16($sp)
	addi $sp, $sp, 20 # Makes space on stack for one register, the ra
	jr $ra


invalid8:
li $v0,0
lw $ra, 0($sp) # Stores $ra register in the stack
	lw $s0, 4($sp) # Stores the caller's s0
	lw $s1, 8($sp) # Stores the caller's s1
	lw $s2, 12($sp) # Stores the callers s2
	lw $s4, 16($sp)
	addi $sp, $sp, 20 # Makes space on stack for one register, the ra
	jr $ra



 

# Part IX
increment_time:
addi $sp, $sp, -36 # Makes space on stack for one register, the ra
	sw $ra, 0($sp) # Stores $ra register in the stack
	sw $s0, 4($sp) # Stores the caller's s0
	sw $s1, 8($sp) # Stores the caller's s1
	sw $s2, 12($sp) # Stores the callers s2
	sw $s3, 16($sp) #size keep 
	sw $s4, 20($sp) #integer check
	sw $s5, 24($sp) #check for already done
	sw $s6, 28($sp) 
	sw $s7, 32($sp)
li $t0, 0 #loop counter for inner 
li $t1,0 #random for inner 
li $t2,0 #random for inner 
li $t3,0
li $t4,0
li $t5,0
li $t6,0
li $t7,0
li $t8,0
li $t9,0 
move $s0,$a0 #queue
move $s6,$a0
move $s1,$a1 #delta min
move $s2,$a2 #famlevel 
lhu $s5,0($s0) #get size
beqz $s5,invalid9
ble $s1,$zero,invalid9
ble $s2,$zero,invalid9


initial:
addi $s0,$s0,10 #increase 
lhu  $s3,0($s0) #get wait time 
add $t8,$s3,$s1 #t8 = new wait time
sh $t8,0($s0) #load new wait time

increasewait:
beq $t9,$s5,famelevel #if t9 = size done
addi $s0,$s0,8 #increase 
lhu  $s3,0($s0) #get wait time 
add $t8,$s3,$s1 #t8 = new wait time
sh $t8,0($s0) #load new wait time 
addi $t9,$t9,1
j increasewait

famelevel:
li $t9,0
move $s0,$s6
fameloop:
beq $t9,$s5,buildheap #if t9 = size done
addi $s0,$s0,8 #incremet by 8 
lhu $s4,0($s0) #get fame
bgt  $s4,$s2,fameloop #increment again
add $t8,$s1,$s4
sh $t8,0($s0) 
addi $t9,$t9,1 #increment
j fameloop


buildheap:
move $a0,$s6
jal build_heap
li $t6,0
j average

average:
li $t9,0
move $s0,$s6
li $s7,0
addi $s0,$s0,10
lhu  $s3,0($s0) #get wait time 
add $s7,$s7,$s3
addi $t6,$s5,-1
averageloop:
beq $t9,$t6,divide #if t9 = size done
addi $s0,$s0,8
lhu  $s3,0($s0) #get wait time 
add $s7,$s7,$s3
addi $t9,$t9,1
j averageloop

divide:
div $s7,$s5 #divide by size
mflo $s7
move $v0,$s7
lw $ra, 0($sp) # Stores $ra register in the stack
	lw $s0, 4($sp) # Stores the caller's s0
	lw $s1, 8($sp) # Stores the caller's s1
	lw $s2, 12($sp) # Stores the callers s2
	lw $s3, 16($sp)
	lw $s4, 20($sp)
	lw $s5, 24($sp)
	lw $s6, 28($sp)
	lw $s7, 32($sp)
	addi $sp, $sp, 36 # Makes space on stack for one register, the ra
	jr $ra



invalid9:
li $v0,-1
lw $ra, 0($sp) # Stores $ra register in the stack
	lw $s0, 4($sp) # Stores the caller's s0
	lw $s1, 8($sp) # Stores the caller's s1
	lw $s2, 12($sp) # Stores the callers s2
	lw $s3, 16($sp)
	lw $s4, 20($sp)
	lw $s5, 24($sp)
	lw $s6, 28($sp)
	lw $s7, 32($sp)
	addi $sp, $sp, 36 # Makes space on stack for one register, the ra
	jr $ra

jr $ra

# Part X
admit_customers:
addi $sp, $sp, -36 # Makes space on stack for one register, the ra
	sw $ra, 0($sp) # Stores $ra register in the stack
	sw $s0, 4($sp) # Stores the caller's s0
	sw $s1, 8($sp) # Stores the caller's s1
	sw $s2, 12($sp) # Stores the callers s2
	sw $s3, 16($sp) #size keep 
	sw $s4, 20($sp) #integer check
	sw $s5, 24($sp) #check for already done
	sw $s6, 28($sp) 
	sw $s7, 32($sp)
li $t0, 0 #loop counter for inner 
li $t1,0 #random for inner 
li $t2,0 #random for inner 
li $t3,0
li $t4,0
li $t5,0
li $t6,0
li $t7,0
li $t8,0
li $t9,0 
move $s0,$a0 #queue
move $s1,$a1 #max admits
move $s2,$a2 #admitted 
lhu $s5,0($s0) #get size
beqz $s5,invalid10
ble $s1,$zero,invalid10
li $s3,0 #dequed customemr
li $t9,0
li $s7,0 #admittted
li $s6,0


admit:
beq $s6,$s5,finish #if you hit max size of queue
beq $s6,$s1,finish #if hits max done
move $a0,$s0 #queue
move $a1,$s2 #where dequeued customer will go. 
jal dequeue
addi $s2,$s2,8
addi $s7,$s7,1
addi $s6,$s6,1
j admit 

finish:
move $v0,$s7 
lw $ra, 0($sp) # Stores $ra register in the stack
	lw $s0, 4($sp) # Stores the caller's s0
	lw $s1, 8($sp) # Stores the caller's s1
	lw $s2, 12($sp) # Stores the callers s2
	lw $s3, 16($sp)
	lw $s4, 20($sp)
	lw $s5, 24($sp)
	lw $s6, 28($sp)
	lw $s7, 32($sp)
	addi $sp, $sp, 36 # Makes space on stack for one register, the ra
	jr $ra









invalid10:
li $v0,-1
lw $ra, 0($sp) # Stores $ra register in the stack
	lw $s0, 4($sp) # Stores the caller's s0
	lw $s1, 8($sp) # Stores the caller's s1
	lw $s2, 12($sp) # Stores the callers s2
	lw $s3, 16($sp)
	lw $s4, 20($sp)
	lw $s5, 24($sp)
	lw $s6, 28($sp)
	lw $s7, 32($sp)
	addi $sp, $sp, 36 # Makes space on stack for one register, the ra
	jr $ra


jr $ra

# Part XI
seat_customers:
addi $sp, $sp, -36 # Makes space on stack for one register, the ra
	sw $ra, 0($sp) # Stores $ra register in the stack
	sw $s0, 4($sp) # Stores the caller's s0
	sw $s1, 8($sp) # Stores the caller's s1
	sw $s2, 12($sp) # Stores the callers s2
	sw $s3, 16($sp) #size keep 
	sw $s4, 20($sp) #integer check
	sw $s5, 24($sp) #check for already done
	sw $s6, 28($sp) 
	sw $s7, 32($sp)

move $s0,$a0 #admitted
move $s4,$a0 #admited 2
move $s1,$a1 #num_admitted
move $s2,$a2 #budget
li $s3,2 #max iterations
li $s5,0 #save index
li $s6,0 #fame
li $s7,0 #wait tiem 

li $t5,0
li $t6,0
blez $s1,invalid11
blez $s2,invalid11

#temporary
li $t0, 0 #loop counter for inner 
li $t1,0 #random for inner 
li $t2,0 #random for inner 
li $t3,0
li $t4,0
li $t5,0
li $t6,0
li $t7,0
li $t8,0
li $t9,0 


#calculating 2^admitted 
li  $t9,0 #use for calculating max loop 
li $t8,0  #loop for calc max
li $t7,2
addi $t9,$s1,-1 #subtract 1 to num admitted
calculatemax:
beq $t8,$t9,preouter #start going through when done
mul $s3,$t7,$s3
addi $t8,$t8,1
j calculatemax 

#outerloop
preouter:
li $t9,-1 #keep at neg 1
outer:
addi $t9,$t9,1 #increment by 1 
beq $t9,$s3,done 
j preinner

preinner:
li $s5,0 
li $t4,0
li $t5,0 
li $t0,0
li $t3,0
j inner


#innerloop
inner:
beq $t0,$s1,checkvalues
srlv $t1,$t9,$s5
andi $t2,$t1,1 
beqz $t2,increaseshift
li $t3,8
mul $t3,$t3,$s5 #8i 
addi $t3,$t3,4 #plus 4 for fame 
add $s0,$s0,$t3 #increment to fame 
lh $t3,0($s0) #get fame 
add $t4,$t3,$t4 #increment the fame 
move $s0,$s4 #change back array u 
li $t3,8
mul $t3,$t3,$s5 #8i 
addi $t3,$t3,6 #plus 6 for weight
add $s0,$s0,$t3 #increment to weight
lh $t3,0($s0) #get fame 
add $t5,$t3,$t5 #increment the weight
addi $t0,$t0,1 #increase the loop count 
addi $s5,$s5,1 #increase the index as well 
move $s0,$s4 #change back array
j inner 

checkvalues:
bgt  $t5,$s2,outer #if the combo weight is over, then u go to next number dont save
blt $t4,$s6,outer #if fame is less than current fame, then dont update go to nexr
move $s6,$t4 #if fame is greater than and weight is good, convert over. 
move $t6,$t9 #make current index value into highest 
j outer 

increaseshift:
addi $t0,$t0,1 #next bit 
addi $s5,$s5,1 #next bit 
j inner


done:
move $v0,$t6
move $v1,$s6 
lw $ra, 0($sp) # Stores $ra register in the stack
	lw $s0, 4($sp) # Stores the caller's s0
	lw $s1, 8($sp) # Stores the caller's s1
	lw $s2, 12($sp) # Stores the callers s2
	lw $s3, 16($sp)
	lw $s4, 20($sp)
	lw $s5, 24($sp)
	lw $s6, 28($sp)
	lw $s7, 32($sp)
	addi $sp, $sp, 36 # Makes space on stack for one register, the ra
	jr $ra

invalid11:
li $v0,-1
li $v1,-1
lw $ra, 0($sp) # Stores $ra register in the stack
	lw $s0, 4($sp) # Stores the caller's s0
	lw $s1, 8($sp) # Stores the caller's s1
	lw $s2, 12($sp) # Stores the callers s2
	lw $s3, 16($sp)
	lw $s4, 20($sp)
	lw $s5, 24($sp)
	lw $s6, 28($sp)
	lw $s7, 32($sp)
	addi $sp, $sp, 36 # Makes space on stack for one register, the ra
	jr $ra


#################### DO NOT CREATE A .data SECTION ####################
#################### DO NOT CREATE A .data SECTION ####################
#################### DO NOT CREATE A .data SECTION ####################
