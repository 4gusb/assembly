#1. print ASCII values 33-57 between brackets

.text

li a7, 11 
li x5, 33
li x6, 57

loop:
    li a0, 91
    ecall
    add a0, x5, x0
    ecall
    li a0, 93
    ecall
    addi x5, x5, 1
    ble x5, x6, loop

li a7, 10
ecall


#2. count number of elements
.data
var: .word 100,1000,65536,65537,1000000,0
finvar: 

.text
la x5, var #pointer to first element
la x6, finvar #pointer to last element
add x7, x0, x0 #counter

loop:
    addi x7,x7, 1
    addi x5, x5, 4
    blt x5, x6, loop
    
li a7, 1
add a0, x7, x0
ecall
li a7, 10
ecall


#3. Print each element separated by semicolons, using a sub-routine
.data
var: .word 100,1000,65536,65537,1000000,0
finvar: 

.text
.text
la a1, var
la a2, finvar
sub a2, a2, a1
srai a2,a2, 2
jal x1, printVector
li a7,10
ecall
nop

printVector:
    li x5, 0 #counter
    loop:
        li a7, 1
        lw a3, 0(a1)
        add a0, a3, x0
        ecall
        li a7, 11
        li a0, 59
        ecall
        addi a1, a1, 4
        addi x5, x5, 1
        blt x5, a2, loop
    ret 
