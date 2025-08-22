.globl valutaScacchiera
.text

valutaScacchiera:
    la   $t0, plancia        # puntatore alla plancia
    li   $v0, 0              # default: nessuna vittoria

# ------------------------
# Controllo verticale
# ------------------------
vert_loop:
    lb   $t1, 0($t0)         # prima cella
    beqz $t1, vert_next      # se vuota, salta
    lb   $t2, 9($t0)
    bne  $t1, $t2, vert_next
    lb   $t3, 18($t0)
    bne  $t1, $t3, vert_next
    lb   $t4, 27($t0)
    bne  $t1, $t4, vert_next
    move $v0, $t1
    jr   $ra

vert_next:
    addi $t0, $t0, 1
    li   $t5, 36             # limite verticale (colonne possibili)
    blt  $t0, $t5, vert_loop

# ------------------------
# Controllo orizzontale
# ------------------------
la   $t0, plancia
horiz_loop:
    lb   $t1, 0($t0)
    beqz $t1, horiz_next
    lb   $t2, 1($t0)
    bne  $t1, $t2, horiz_next
    lb   $t3, 2($t0)
    bne  $t1, $t3, horiz_next
    lb   $t4, 3($t0)
    bne  $t1, $t4, horiz_next
    move $v0, $t1
    jr   $ra

horiz_next:
    addi $t0, $t0, 1
    li   $t5, 49
    blt  $t0, $t5, horiz_loop

# ------------------------
# Controllo diagonale 1 (\)
# ------------------------
la   $t0, plancia
diag1_loop:
    lb   $t1, 0($t0)
    beqz $t1, diag1_next
    lb   $t2, 10($t0)
    bne  $t1, $t2, diag1_next
    lb   $t3, 20($t0)
    bne  $t1, $t3, diag1_next
    lb   $t4, 30($t0)
    bne  $t1, $t4, diag1_next
    move $v0, $t1
    jr   $ra

diag1_next:
    addi $t0, $t0, 1
    li   $t5, 22
    blt  $t0, $t5, diag1_loop

# ------------------------
# Controllo diagonale 2 (/)
# ------------------------
la   $t0, plancia
addi $t0, $t0, 4
diag2_loop:
    lb   $t1, 0($t0)
    beqz $t1, diag2_next
    lb   $t2, 8($t0)
    bne  $t1, $t2, diag2_next
    lb   $t3, 16($t0)
    bne  $t1, $t3, diag2_next
    lb   $t4, 24($t0)
    bne  $t1, $t4, diag2_next
    move $v0, $t1
    jr   $ra

diag2_next:
    addi $t0, $t0, 1
    li   $t5, 22
    blt  $t0, $t5, diag2_loop

    jr $ra                 # se nessuno ha vinto, ritorna 0
