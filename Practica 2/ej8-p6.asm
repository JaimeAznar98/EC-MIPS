.data
A: .space 4
B: .space 4

A_in: .asciiz "Introduce el primer numero: "
B_in: .asciiz "Introduce el segundo numero: " 

.text

la $a0, A_in
li $v0, 4
syscall
li $v0, 5
syscall

sw $v0, A
la $a0, A
li $v0, 34
syscall

li $a0, '\n'
li $v0, 11
syscall

la $a0, A
lw $a0, 0($a0)
li $v0, 1
syscall

li $a0, '\n'
li $v0, 11
syscall

la $a0, B_in
li $v0, 4
syscall
li $v0, 5
syscall

sw $v0, B
la $a0, B
li $v0, 34
syscall

li $a0, '\n'
li $v0, 11
syscall

la $a0, B
lw $a0, 0($a0)
li $v0, 1
syscall

li $a0, '\n'
li $v0, 11
syscall

la $a0, A
la $a1, B

lw $a0, 0($a0)
lw $a1, 0($a1)

bge $a0, $a1, B_mayor
li $v0, 1
syscall
move $a0, $a1
li $v0, 1
syscall
j acabar


B_mayor: 
	move $t0, $a0
	move $a0, $a1
	li $v0, 1
	syscall
	move $a0, $t0
	li $v0, 1
	syscall
	j acabar
	
acabar: li $v0, 10
	syscall	



