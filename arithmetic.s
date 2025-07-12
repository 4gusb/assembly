#1. Write the instruction that loads the decimal value 128 (in hexadecimal: 0x80) into temporary register 0 (t0, or x5). Remember that x0 always holds the value 0.
.text    
	addi t0, x0, 128    

#2. Write an instruction that loads the hexadecimal value 0x12345000 into x5.
.text
	lui x5, 0x12345

#3. Combine lui and addi to assign the value 0x87654321 to x5. Then, do the same using only li and compare behaviours.
.text
	lui x5, 0x87654
	addi x5, x5, 0x321

 .text
	li x5, 0x87654321

#We can see that both blocks of code produce the same machine code, since li is just a pseudoinstruction that saves us from writing both lines separately.

#4. Assign the value 2047 to x5, then decrease its value by 1.
.text
	li x5, 2047
	addi x5, x5, -1

#5. Given the positive number 4 stored in x5, convert it to negative and store it in x4.
.text
	li x5, 4
	sub x4, x0, x5 

#Note: In RISC-V, to negate a number, you can subtract it from zero.

#6. Print a stored signed word
.data
var: .word 123456

.text
la x5, var
lw x6, 0(x5)
li a7, 1
add a0, x6, x0
ecall
li a7, 10
ecall

#7. Print a stored signed half-word
.data
var: .half 32769

.text
la x5, var
lh x6, 0(x5)
li a7, 1
add a0, x6, x0
ecall
li a7, 10
ecall


#8. Print the third element of the vector
.data
var: .word 100,1000,65536,65537,1000000,0

.text
la x5, var
lw x6, 8(x5)
add a0, x6, x0
li a7, 1
ecall
li a7, 10
ecall
