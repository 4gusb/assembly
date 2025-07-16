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


#4. Print length of string without modifying original pointer
.data
string: .string "Hello World!"

.text
la a1, string
jal PrintLen #must print number of elements
li a7, 10 #print execution with no errors
ecall
nop

PrintLen:
    li a3, 0 #initiating counter
    addi a5, a1, 0 #copy pointer to a5
    loop:
        lb a2, 0(a5)
        beq a2, zero, end
        addi a5, a5, 1
        addi a3, a3, 1 
        jal x0, loop
    end: 
        li a7, 1
        addi a0, a3, 0
        ecall
        ret

#5. Print string in reverse

.data
string: .string "ERIPME EHT NIOJ"

.text
la a1, string
jal reverseStr
li a7, 10
ecall
nop


reverseStr:
    addi a6, x1, 0 #saves return address to main
    jal StrLen #saves number of element at a3
    li a7, 11  
    add a4, a1, a3 #saves pointer to first element + number of elements
    addi a4, a4, -1 #saves pointer + number of elements - 1, because otherwise will point to \0. a4 will decrement until reaching first element
    reverseStr_loop:
        lb a0, 0(a4) 
        ecall
        addi a4, a4, -1 #decrement a position
        bge a4, a1, reverseStr_loop
        addi x1, a6, 0 #restores the return address to main
        ret
     
StrLen:
    li a3, 0 #initiating counter
    addi a5, a1, 0 #copy pointer to a5
    StrLen_loop:
        lb a2, 0(a5)
        beq a2, zero, end
        addi a5, a5, 1
        addi a3, a3, 1 
        jal x0, StrLen_loop
    end: 
        ret
