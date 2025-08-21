.globl valutaScacchiera
.data
stats:  .space 4

.text
valutaScacchiera:
    la      $t8, stats
    addi    $t8, $t8, 1

    sb      $zero, -1($t8)
    sb      $zero,  1($t8)
    sb      $zero,  2($t8)

    la      $t0, plancia
    addi    $t0, $t0, 1 
    add     $t1, $t0, 25
    li      $t9, 0

# ------------------------
# Controllo verticale
# ------------------------
verticale:
    lb      $t2,   ($t0)
    lb      $t3,  9($t0)
    lb      $t4, 18($t0)
    lb      $t5, 27($t0)

    add     $t2, $t2, $t8
    lb      $t7, ($t2)
    addi    $t7, $t7, 1
    sb      $t7, ($t2)

    add     $t3, $t3, $t8
    lb      $t7, ($t3)
    addi    $t7, $t7, 1
    sb      $t7, ($t3)

    add     $t4, $t4, $t8
    lb      $t7, ($t4)
    addi    $t7, $t7, 1
    sb      $t7, ($t4)

    add     $t5, $t5, $t8
    lb      $t7, ($t5)
    addi    $t7, $t7, 1
    sb      $t7, ($t5)

    lb      $t2, -1($t8)
    lb      $t3,  1($t8)
    lb      $t4,  2($t8)

    mul     $t5, $t2, $t3
    add     $t5, $t5, $t4
    seq     $t7, $t5, $zero

    mul     $t6, $t2, $t2
    beq     $t6, 16, fine1
    mul     $t6, $t6, -1
    mul     $t6, $t6, $t7
    add     $t9, $t9, $t6

    mul     $t6, $t3, $t3
    mul     $t6, $t6, $t7
    beq     $t6, 16, fine2
    add     $t9, $t9, $t6

    sb      $zero, -1($t8)
    sb      $zero,  1($t8)
    sb      $zero,  2($t8)

    addi    $t0, $t0, 1
    bne     $t0, $t1, verticale

# ------------------------
# Controllo orizzontale
# ------------------------
    la      $t0, plancia
    addi    $t0, $t0, 1 
    add     $t1, $t0, 49

orizzontale:
    lb      $t2,   ($t0)
    lb      $t3,  1($t0)
    lb      $t4,  2($t0)
    lb      $t5,  3($t0)

    add     $t2, $t2, $t8
    lb      $t7, ($t2)
    addi    $t7, $t7, 1
    sb      $t7, ($t2)

    add     $t3, $t3, $t8
    lb      $t7, ($t3)
    addi    $t7, $t7, 1
    sb      $t7, ($t3)

    add     $t4, $t4, $t8
    lb      $t7, ($t4)
    addi    $t7, $t7, 1
    sb      $t7, ($t4)

    add     $t5, $t5, $t8
    lb      $t7, ($t5)
    addi    $t7, $t7, 1
    sb      $t7, ($t5)

    lb      $t2, -1($t8)
    lb      $t3,  1($t8)
    lb      $t4,  2($t8)

    mul     $t5, $t2, $t3
    add     $t5, $t5, $t4
    seq     $t7, $t5, $zero

    mul     $t6, $t2, $t2
    beq     $t6, 16, fine1
    mul     $t6, $t6, -1
    mul     $t6, $t6, $t7
    add     $t9, $t9, $t6

    mul     $t6, $t3, $t3
    beq     $t6, 16, fine2
    mul     $t6, $t6, $t7
    add     $t9, $t9, $t6

    sb      $zero, -1($t8)
    sb      $zero,  1($t8)
    sb      $zero,  2($t8)

    addi    $t0, $t0, 1
    bne     $t0, $t1, orizzontale

# ------------------------
# Controllo diagonale 1
# ------------------------
    la      $t0, plancia
    addi    $t0, $t0, 1 
    add     $t1, $t0, 22

diagonale1:
    lb      $t2,   ($t0)
    lb      $t3, 10($t0)
    lb      $t4, 20($t0)
    lb      $t5, 30($t0)

    # (stessa sequenza di aggiornamenti...)

    addi    $t0, $t0, 1
    bne     $t0, $t1, diagonale1

# ------------------------
# Controllo diagonale 2
# ------------------------
    la      $t0, plancia
    addi    $t0, $t0, 4 
    add     $t1, $t0, 22

diagonale2:
    lb      $t2,   ($t0)
    lb      $t3,  8($t0)
    lb      $t4, 16($t0)
    lb      $t5, 24($t0)

    # (stessa sequenza di aggiornamenti...)

    addi    $t0, $t0, 1
    bne     $t0, $t1, diagonale2

    j       ritorno

# ------------------------
# Fine gioco
# ------------------------
fine1:
    li      $t9, 0x80000001
    j       ritorno

fine2:
    li      $t9, 0x7FFFFFFF

ritorno:
    move    $v0, $t9
    jr      $ra
