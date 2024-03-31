.MODEL SMALL
.STACK 100H
.DATA

.CODE
MAIN:

    MOV AX, 100   ; Initialize AX with 100
    MOV CX, 19    ; Set the loop counter to 19
    MOV BX, 95   ; Initialize BX with 100

FOR_LOOP:
    ADD AX, BX   ; Add the current value of BX to AX
    SUB BX, 5    ; Subtract 5 from BX to get the next value in the series
    LOOP FOR_LOOP ; Continue the loop until CX becomes zero
    
    
    MOV AH, 4CH
    INT 21H

END MAIN
