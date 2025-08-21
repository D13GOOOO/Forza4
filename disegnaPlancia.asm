.data
    .align 2
    capo:   .asciiz "\n"
    spazio: .asciiz " "
    muro:   .asciiz "#"
    vuoto:  .asciiz "."
    G1:     .asciiz "X"
    G2:     .asciiz "O"
    clear:  .asciiz "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" 

.text
.globl disegnaPlancia
disegnaPlancia:
    la    $a0, clear
    li    $v0, 4
    syscall

    la    $t0, plancia
    li    $t1, 0
    li    $t3, 1
    la    $a0, spazio
    li    $v0, 4
    syscall

loop:
    lb    $t2, ($t0)
    beq   $t2, 2, wall
    beq   $t2, 1, X
    beq   $t2, -1, O
    beq   $t2, 0, null

wall:
    la    $a0, muro
    li    $v0, 4
    syscall
    j     continue

X:
    la    $a0, G1
    li    $v0, 4
    syscall
    j     continue

O:
    la    $a0, G2
    li    $v0, 4
    syscall
    j     continue

null:
    la    $a0, vuoto
    li    $v0, 4
    syscall

continue:
    add   $t0, $t0, 1
    add   $t1, $t1, 1
    li    $t8, 9
    div   $t1, $t8
    mfhi  $t9
    bnez  $t9, nnewline

    la    $a0, capo
    li    $v0, 4
    syscall

nnewline:
    beq   $t1, 63, numeri
    la    $a0, spazio
    li    $v0, 4
    syscall
    j     loop

numeri:
    la    $a0, spazio
    li    $v0, 4
    syscall
    la    $a0, spazio
    li    $v0, 4
    syscall
    la    $a0, spazio
    li    $v0, 4
    syscall

noop:
    move  $a0, $t3
    li    $v0, 1
    syscall
    la    $a0, spazio
    li    $v0, 4
    syscall
    add   $t3, $t3, 1
    beq   $t3, 8, fine
    j     noop

fine:
    la    $a0, capo
    li    $v0, 4
    syscall
    jr    $ra
