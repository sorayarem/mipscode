    .data
newline: .asciiz "\n"
fizz: .asciiz "FIZZ\n"
buzz: .asciiz "BUZZ\n"
fizzbuzz: .asciiz "FIZZBUZZ\n"

    .text
main:
    # start value = 0 (i)
    li $t0, 0
    #start value = 99
    li $t1, 99

floop:
    # check if done with loop (i>100), otherwise exit
    bgt $t0, $t1, done     

    #increment i by one
    addi $t0, $t0, 1

    #if still in the game, try fizzbuzz
    rem $t2, $t0, 5
    rem $t3, $t0, 3
    slti $t2, $t2, 1
    slti $t3, $t3, 1
    and $t2, $t2, $t3
    beq $t2, 1, printfb 
    
    #if still in the game, try buzz
    rem $t2, $t0, 5
    beq $t2, 0, printb

    #if still in the game, try fizz
    rem $t2, $t0, 3
    beq $t2, 0, printf

    #if still in the game, print i
    move $a0, $t0
    li $v0, 1
    syscall

    la  $a0, newline 
    li  $v0, 4          
    syscall        
    
    j   floop

printfb:
    move $a0, $t0
    la $a0, fizzbuzz
    li $v0, 4
    syscall
    
    j   floop

printf:
    move $a0, $t0
    la $a0, fizz
    li $v0, 4
    syscall
    
    j   floop

printb:
    move $a0, $t0
    la $a0, buzz
    li $v0, 4
    syscall
    
    j   floop

done:
    li  $v0, 10
    syscall         # exit