.MODEL SMALL
.STACK 100H
.DATA
    DIGIT1 DB "1$"
    RESULT DB  ",$"
    CONST_VALUE DB 0 ; FOR FIRST ITERATION DIFFERENCE KEPT 0 TO PRINT 1
    CONST_CARRY DB 0;
.CODE
MAIN:

    MOV AX, @DATA
    MOV DS, AX
    MOV CL, 1 ; TO PRINT FIRST VALUE OF THE SERIES =1
    MOV SI, 0;
     MOV BL, 9
        MOV CL, 5 
        

NEXT1:

    MOV AL, BL
    MOV BH, AL

    MOV AL, CL
    MOV BL, AL ; =>21-44418-1

    MOV AL, 00
    MOV CH, AL

    MOV AL, [CONST_VALUE] ; difference is constant = 04 AFTER FIRST ITERATION
    MOV CL, AL ; CH:CL SECOND NUMBER

    SUB BL, CL ; Subtract CL from BL

    MOV AL, BL
    MOV AH, 00H
    AAA

    MOV CL, AL ; LAST DIGIT OF ANSWER
    MOV BL, AH

    SUB BH, 00H ; Subtract any previous carry from BH
    SUB BH, CH

    MOV AL, BH
    MOV AH, 00H
    AAA

    MOV BX, AX

    MOV DX, OFFSET RESULT ; printing 3 digit result calculated with carry
    MOV AH, 09H
    INT 21H

    MOV DL, BL ; leftmost result digit of a series value
    ADD DL, 30H
    MOV AH, 02H
    INT 21H

    MOV DL, CL ; result digit of a series value in the middle position
    ADD DL, 30H
    MOV AH, 02H
    INT 21H

    MOV DL, CH ; rightmost result digit of a series value
    ADD DL, 30H
    MOV AH, 02H
    INT 21H

    MOV [CONST_VALUE], 4 ; Set the constant value for the next iteration
    INC SI;
    CMP SI, 50
    JNE NEXT1
    JE EXIT

EXIT:
    MOV AH, 4CH
    INT 21H
END MAIN
