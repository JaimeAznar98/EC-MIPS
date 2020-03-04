
.text
li $s0, 1
li $s1, 11
li $s2, 0

bucle_do_while: 
		add $s2, $s2, $s0
		addi $s0, $s0, 1
		sle $t1, $s0, $s1
		beqz $t1, acabar
		j bucle_do_while
		
		
acabar: li $v0, 10
	syscall