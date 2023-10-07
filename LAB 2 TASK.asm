
.MODEL SMALL
.STACK 100H
.DATA
    CR EQU 0DH
    LF EQU 0AH
    MSG1 DB 'ENTER AN UPPER CASE LETTER $'
    MSG2 DB 0DH, 0AH, 'IN LOWER CASE IT IS: '
    CHAR DB ?,'$'

.CODE

MAIN PROC       
    
    MOV AX, @DATA      
    MOV DS, AX          
    
    
    LEA DX, MSG1        
    MOV AH, 9            
    INT 21H               
   

    MOV AH, 1            
    INT 21H              
    ADD AL, 20H          
    MOV CHAR, AL        
    
   
    LEA DX, MSG2        
    MOV AH, 9            
    INT 21H             
    
   
    MOV AH, 4CH
    INT 21H              
    
MAIN ENDP
END MAIN
