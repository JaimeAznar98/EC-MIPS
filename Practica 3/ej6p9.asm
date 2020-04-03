.data 
Xpide:.asciiz "X = " 
Ypide:.asciiz "Y = " 
MaxRes: .asciiz "El mayor es " 

.text 
la $a0, Xpide 
li $v0,4 
syscall
li $v0,6 
syscall 
mov.s $f12,$f0 

la $a0, Ypide 
li $v0,4 
syscall 
li $v0,6 
syscall 
mov.s $f14,$f0 

jal max 
la $a0,MaxRes 
li $v0,4 
syscall 
mov.s $f12,$f0 

li $v0,2 
syscall 
li $v0,10 
syscall 



max:
	#mover a registros para trabajar con ellos
	mov.s $f1, $f12
	mov.s $f2, $f14
	c.le.s $f1, $f2
	bc1t set_B
	bc1f set_A

set_A: mov.s $f0, $f1
	jr $ra

set_B: mov.s $f0, $f2
	jr $ra	
