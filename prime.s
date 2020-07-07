#t180d510 Tsuzuki Riku
.text
main:
    li $s1, 0x1000A000   #initialize
    addi $s0, $zero, 997

    addi $t0, $zero, 2 #if a < 2 then End
    addi $t1, $zero, 1
    slt  $t2, $s0, $t0
    beq  $t1, $t2, End
    addi $s3, $s0, 1
    
    addi $s2, $zero, 1 #add 2 to primeList
    sw   $t0, 0($s1)
    add  $s1, $s1, 4
Loop:           #find prime num loop
    addi $t0, $t0, 1
    beq  $t0, $s3, End
    andi $t1, $t0, 1 #if t0 is even then continue
    beq  $t1, $zero, Loop
    li   $t2, 0x1000A000
Check:          #check to prime
    beq  $t2, $s1, AddPrime
    lw   $t3, 0($t2)
    div  $t0, $t3   #div by the num in the list
    mfhi $t1        #remainder of div
    beq  $t1, $zero, Loop
    addi $t2, $t2, 4
    j    Check
AddPrime:       #add to primeList
    addi $s2, $s2, 1
    sw   $t0, 0($s1)
    add  $s1, $s1, 4
    j    Loop
End:
    jr $ra