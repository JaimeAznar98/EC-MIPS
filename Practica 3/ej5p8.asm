.data
mmask: .word 0x007fffff
emask: .word 0x7f800000
exp1: .word 255
desborde: .asciiz "Se ha desbordado"

.text
addi $s0, $0, 1
sll $s0, $s0, 30
mtc1 $s0, $f0
cvt.s.w $f0, $f0
mul.s $f0, $f0, $f0
mul.s $f0, $f0, $f0
mul.s $f0, $f0, $f0
#s0 vale 2 elevado a 240, que en entero corresponde con el valor de la mascara del exponente
mfc1 $s0,  $f0 
lw $t4, mmask 
and  $t0, $s0, $t4
lw $t4, emask
and $t2, $s0, $t4
srl $t2, $t2, 23
lw $t3, exp1
beq $t2, $t3, exp_a_1 #con el desplazamiento de 23, en t2 se quedan 0x000000ff

li $v0, 10
syscall

exp_a_1: la $a0, desborde
	li $v0, 4
	syscall

	li $v0, 10
	syscall