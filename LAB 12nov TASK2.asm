.MODEL SMALL
.STACK 100H                        
.DATA
    CR EQU 0DH
    LF EQU 0AH
    MSG1 DB 'ENTER A CHARACTER: $'
    MSG2 DB 0DH, 0AH, '$'
    CHAR DB ?,'$'

.CODE

MAIN PROC       
    
    MOV AX, @DATA      
    MOV DS, AX          
    MOV CX,0
    
    LEA DX, MSG1        
    MOV AH, 9            
    INT 21H    
     MOV AH, 1            
    INT 21H           
    MOV bl, AL            
     
     
    LEA DX, MSG2        
    MOV AH, 9            
    INT 21H 
LoopS:
          
    MOV AH, 2    
    MOV DL, bl;           
    INT 21H 
    INC CX
    CMP CX, 50
    JNE LoopS            
    
   
    MOV AH, 4CH
    INT 21H              
    
MAIN ENDP
END MAIN
