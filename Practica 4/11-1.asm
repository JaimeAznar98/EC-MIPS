.data
mis0: .asciiz "Arriba españa"
.kdata
registros: .word 0,0,0,0

mis1: .asciiz "\nExcepción dirección errónea ocurrida en la dirección: "
mis2: .asciiz "\nExcepción desbordamiento ocurrida en la dirección: "
mis3: .asciiz "\nEn cualquier caso continuamos con el programa... \n"





.ktext 0x80000180

la $k1, registros
sw $at, 0($k1)
sw $v0, 4($k1)
sw $a0, 8($k1)

mfc0 $a0, $13
andi $a0, $a0, 0x3C

li $s0, 0x0030
li $s1, 0x0014
beq $a0, $s0, Desbordo
bne $a0, $s1, salida
la $a0, mis1
li $v0, 4 
syscall

mfc0 $a0, $14
li $v0, 34
syscall

Desbordo:
	la $a0, mis2
	li $v0, 4
	syscall
	mfc0 $a0, $14
	li $v0, 34
	syscall

salida:
	la $a0, mis3
	li $v0, 4
	syscall
	
la $k1, registros
lw $at, 0($k1)
lw $v0, 4($k1)
lw $a0, 8($k1)

mtc0 $zero, $8


mfc0 $k0, $14
addiu $k0, $k0, 4
mtc0 $k0, $14
eret	



.text
li $t0, 0x7FFFFFFF
addiu $t1, $t0,1 
addi $t2, $t0, 1 

la $a0, mis0
li $v0, 4
syscall



