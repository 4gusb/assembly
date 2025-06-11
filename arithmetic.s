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
