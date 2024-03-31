.MODEL SMALL
.STACK 100H
.DATA     

    MSG1 DB 'ENTER TWO UPPER CASE LETTER: $'  
    MSG2 DB 0AH, 0DH, 'REVERSE ORDER: $'
    CHAR1 DB ? ; Variable to store the first character
    CHAR2 DB ? ; Variable to store the second character
    ERROR_MSG DB 0AH, 0DH,'ERROR: INPUTS MUST BE IN CAPITAL LETTERS!$'

.CODE

MAIN PROC
    
    MOV AX, @DATA      
    MOV DS, AX          
    
    
    LEA DX, MSG1        
    MOV AH, 9            
    INT 21H  
    
    MOV AH, 1       ; INPUT FUNCTION
    INT 21H         ; INT = Interrupt
    MOV BL, AL

    ; Check if it's a capital letter
    CMP BL, 'A'
    JL SHOW_ERROR
    CMP BL, 'Z'
    JG SHOW_ERROR

    MOV CHAR1, BL
    INT 21H

    MOV BH, AL

    ; Check if it's a capital letter
    CMP BH, 'A'
    JL SHOW_ERROR
    CMP BH, 'Z'
    JG SHOW_ERROR

    MOV CHAR2, BH  
    
    LEA DX, MSG2    ; Print a newline        
    MOV AH, 9            
    INT 21H 

    MOV AH, 2       ; OUTPUT FUNCTION
    MOV DL, CHAR2   ; Print the second character first (in reverse order)
    INT 21H

    MOV DL, CHAR1   ; Print the first character (in reverse order)
    INT 21H

    
    MOV AH, 4CH     ; Exit program
    INT 21H

SHOW_ERROR:
    ; Display an error message
    LEA DX, ERROR_MSG
    MOV AH, 9
    INT 21H

    MOV AH, 4CH     ; Exit program
    INT 21H

MAIN ENDP
END MAIN
