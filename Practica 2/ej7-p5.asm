
.text
li $s0, 1
li $s1, 11
li $s2, 0

bucle_do_while_while: 

		add $s1, $s1, $s5
		slt $t0, $s2, $s1
		bne $t0, $zero, acabar
		j bucle_do_while_while
		
		
acabar: li $v0, 10
	syscall
