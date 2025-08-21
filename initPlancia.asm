.text		
.globl initPlancia

initPlancia:
	la $t0, plancia
	addi $t1, $t0, 53
	
	li $t2, 2
	li $t3, 0
	
initPlancia_loop:
	sb $t2, ($t0)
	sb $t3, 1($t0)
	sb $t3, 2($t0)
	sb $t3, 3($t0)
	sb $t3, 4($t0)
	sb $t3, 5($t0)
	sb $t3, 6($t0)
	sb $t3, 7($t0)
	sb $t2, 8($t0)
	addi $t0, $t0, 9
	ble $t0, $t1, initPlancia_loop
	sb $t2,  ($t0)
	sb $t2, 1($t0)
	sb $t2, 2($t0)
	sb $t2, 3($t0)
	sb $t2, 4($t0)
	sb $t2, 5($t0)
	sb $t2, 6($t0)
	sb $t2, 7($t0)
	sb $t2, 8($t0)
	jr $ra
	