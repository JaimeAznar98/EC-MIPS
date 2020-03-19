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




