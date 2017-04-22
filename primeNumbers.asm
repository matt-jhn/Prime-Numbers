#Lab 7: Prime Numbers Program
#Name: Matthew Johnson

.text
.globl main

main:
#calls prompt 1 to ask for a number
li $v0, 4
la $a0, prompt1
syscall

#reads input from the keyboard
li $v0, 5
syscall

#moves the inputted number from $v0 to $t0
move $t0,$v0

#i
li $s0, 2
#j

#exits the program without printing as there are no primes between 0-0, 0-1, 0-2
ble $t0, 2, end2

#begins the looping, skips print as it is the initial run
j loop1

#prints the current number of the outer loop 
print:
li $v0, 1  
move $a0, $s0 
syscall
#prints a space between each number
li $v0, 4
la $a0, space
syscall
#jumps to increment the outer loop
j increment

#sets the arbitrary value "p" ($s1) to 1 to tell the program not to print this iteration
setp1:
li $s1, 1
#increments the inner loop
addiu $s2, $s2, 1
#goes back to the inner loop
j loop2

#increments the outer loop
increment:
addiu $s0, $s0, 1
#checks to end loop
beq $t0, $s0, end
#continues to the loop
j loop1

#checks the arbitrary "p" value, if it is 0, it will print the current iteration of the outer loop
checkPrint:
#jumps to print if 0
beqz $s1, print
#jumps to next loop if 1
j increment

#outer loop
loop1:
#resets "p" to 0
li $s1, 0 #p
#resets inner loop to 2
li $s2, 2
#continues to second loop
j loop2

loop2:
#checks to see if loop is done
beq $s2, $s0, checkPrint
#saves remainder of outer loop divided by inner loop
rem $t1, $s0, $s2  
#if the remainder is 0, jump to set "p" ($s1) to 1
beqz $t1, setp1
#increments inner loop
addiu $s2, $s2, 1
#continues inner loop
j loop2

#end of program
end: li $v0, 10 
syscall
#exits without printing as there are no prime numbers between 0 and 2
end2: li $v0, 10
syscall


.data
prompt1:
 .asciiz "Enter your number: "
space:
 .asciiz " "