# Palindrome detection in MIPS assembly using MARS
# for MYΥ-402 - Computer Architecture
# Department of Computer Engineering, University of Ioannina
# Aris Efthymiou

        .globl main # declare the label main as global. 
        
        .text 
     
main:
        la         $s1, mesg         # get address of mesg to $s1
        addu       $s2, $s1,   $zero # $s2=$s1
loop:
        addiu      $s2, $s2,   1     # $s2=$s1 + 1
        lbu        $t0, 0($s2)       # get next character
        bne        $t0, $zero, loop  # repeat if char not '\0'
        # end of loop here

        addiu      $s2, $s2,  -1     # Adjust $s2 to point to last char

        ########################################################################
        #  Write your code here
        ########################################################################

	#to s1 deixnei sthn arxi kai to s2 deixnei sto telos
	#epanaliptika fortwnw tous xarakthres kai oso einai idioi synexizw
loop2:	
	lbu	$t1, 0($s1)	#fortwnw ton xarakthra apo thn arxi ston t1
	lbu	$t2, 0($s2)	#fortwnw ton xarakthra apo to telos ston t2
	bne	$t1, $t2, notpal
        addiu 	$s1, $s1, 1	#proxwraw ton s1 mia thesi mprosta
        addiu	$s2, $s2, -1	#fernw ton s2 mia thesi pisw
        blt	$s1, $s2, loop2
        
        #an ftasei edw shmainei pws den exei alla psifia ara einai palindromo
        
        addiu	$a0, $zero, 0
        j	exit
notpal:	addiu 	$a0, $zero, 1
exit: 
        addiu      $v0, $zero, 10    # system service 10 is exit
        syscall                      # we are outta here.
        
###############################################################################

        .data
mesg:   .asciiz "raace   ecaar"
