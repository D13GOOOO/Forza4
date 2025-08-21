.globl trovaMiglioreAiRicorsivo
.data

.text
trovaMiglioreAiRicorsivo:
    move  $t0, $fp
    addi  $fp, $sp, -4
    sw    $t0, 0($fp)
    sw    $sp, -4($fp)
    sw    $ra, -8($fp)
    sw    $s0, -12($fp)
    sw    $s1, -16($fp)
    sw    $s2, -20($fp)
    sw    $s6, -24($fp)
    addi  $sp, $fp, -24

    move  $s0, $a0
    move  $s1, $a1
    li    $s2, 1
    li    $v1, 0

ciclo:
    move  $a0, $s2
    move  $a1, $s0
    jal   giocaMossa
    beq   $v0, 1, prossimaMossa

    jal   valutaScacchiera
    mul   $s6, $s0, 0x7FFFFFFF
    beq   $v0, $s6, casoMossaVittoria

casoProfonditaZero:
    mul   $s6, $v0, $s0
    ble   $s6, $v1, prossimaMossa
    move  $v1, $v0
    move  $v0, $s2
    j     prossimaMossa

casoProfonditaNonZero:
    mul   $a0, $s0, -1
    addi  $a1, $s1, -1
    move  $s7, $v1
    jal   trovaMiglioreAiRicorsivo
    mul   $s6, $v1, $s0
    ble   $s6, $s7, ripristinaV1
    move  $v0, $s2

ripristinaV1:
    move  $v1, $s7

prossimaMossa:
    jal   sgiocaMossa
    addi  $s2, $s2, 1
    bne   $s2, 7, ciclo

casoMossaVittoria:
    move  $a0, $s2
    jal   sgiocaMossa

fineFunzione:
    lw    $t0, 0($fp)
    lw    $sp, -4($fp)
    lw    $ra, -8($fp)
    lw    $s0, -12($fp)
    lw    $s1, -16($fp)
    lw    $s2, -20($fp)
    lw    $s6, -24($fp)
    move  $fp, $t0
    jr    $ra
