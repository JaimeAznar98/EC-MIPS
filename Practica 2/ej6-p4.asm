	
.data
intro: .asciiz "Numero a multiplicar por 5: "
		
.text


	la $a0, intro
	li $v0, 4
	
	syscall
	li $v0, 5
	syscall
	move $a0, $v0
	jal mult5
	move $a0, $v0
	jal imprim
	li $v0, 10		 
	syscall
		
	
imprim: addi $v0, $zero, 1
	syscall
	li $a0, '\n'
	li $v0, 11
	syscall
	jr $ra
	
# 5 = 2^2 + 2^0 -> dos desplazamientos logicos izquierda y una suma del original
mult5:	move $t0, $a0
	sll $v0, $a0, 2
	add $v0, $v0, $t0
	jr $ra