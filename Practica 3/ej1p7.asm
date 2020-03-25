
.data 
str: .ascii "Estructura de los"
     .asciiz "Computadores"
     
out: .asciiz "El número de caracteres es: "

 .text
 
  la $s0, str
  add $s1, $zero, $zero
  
  loop: 
  	add $t0, $s0, $s1
  	lb $t1, 0($t0)
  	#move $a0, $t1
  	#li $v0, 11
  	#syscall
  	beq $t1, $zero, imprim
  	addi $s1, $s1, 1
  	
  	j loop
   
   imprim: la $a0, out
   	   li $v0, 4
   	   syscall
   	   move $a0, $s1
   	   li $v0, 1
   	   syscall
   	   j exit
   
   exit:
   	li $v0, 10
   	syscall