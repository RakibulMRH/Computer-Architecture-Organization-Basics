.MODEL SMALL 
.STACK 100H 
.DATA 
    DIGIT1 DB "1$"
    RESULT DB  ",$"
    CONST_VALUE DB 0;FOR FIRST ITERATION DIFFERENCE KEPT 0 TO PRINT 1 
    CONST_CARRY DB 0;
.CODE 
    MAIN: 
    
        MOV AX, @DATA 
        MOV DS, AX 
        MOV CL,1 ;TO PRINT FIRST VALUE OF THE SERIES =1 
        JMP NEXT1  
        MOV SI, 0;  
        
 NEXT1:   
        
        MOV AL, BL 
        MOV BH, AL 
         
        MOV AL, CL 
        MOV BL, AL ; =>21-44418-1
         
        MOV AL, 00 
        MOV CH, AL 
         
        MOV AL, [CONST_VALUE]  ; difference is constant = 04 AFTER FIRST ITERATION
        MOV CL, AL ; CH:CL SECOND NUMBER 
         
        ADD BL, CL 
         
        MOV AL, BL 
        MOV AH, 00H 
        AAA 
         
        MOV CL, AL ; LAST DIGIT OF ANSWER 
        MOV BL, AH 
         
        ADD BL, BH 
        ADD BL, CH 
         
        MOV AL, BL 
        MOV AH, 00H 
        AAA 
         
        MOV BX, AX  
        
        MOV DX, OFFSET RESULT  ;printing 3 digit result calculated with carry
        MOV AH, 09H 
        INT 21H 
        
        ADD BH, [CONST_CARRY] ; Adding carry  
        MOV DL, BH     ;leftmost result digit of a series value
        ADD DL, 30H 
        MOV AH, 02H 
        INT 21H 
         
        MOV DL, BL         ; result digit of a series value of its middle position
        ADD DL, 30H 
        MOV AH, 02H 
        INT 21H 
         
        MOV DL, CL        ;rightmost result digit of a series value
        ADD DL, 30H 
        MOV AH, 02H 
        INT 21H
        
         
        MOV [CONST_CARRY], BH ; SETTING UP CARRY AFTER CROSSING EVERY HUNDRED 
        MOV [CONST_VALUE], 4 ;
        INC SI;
        CMP SI,50
        JNE NEXT1
        JE  EXIT  

    EXIT: 
        MOV AH, 04CH 
        INT 21H 
    END MAIN     
         
         
; CODE ENDS