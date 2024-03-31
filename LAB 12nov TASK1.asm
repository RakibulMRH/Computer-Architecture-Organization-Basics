.MODEL SMALL
.STACK 100H
.DATA
    CR EQU 0DH
    LF EQU 0AH
    MSG1 DB 'ENTER input $'
    MSG2 DB 0DH, 0AH, 'Your input numbers: '
    CHAR DB ?,'$'

.CODE

MAIN PROC       
    
    MOV AX, @DATA      
    MOV DS, AX          
    
    LEA DX, MSG1        
    MOV AH, 9            
    INT 21H   
    mov cx, 0  
    
  takeInput:
    mov ah, 1
    INT 21H  ; read a key press 
    
    cmp al, 0DH 
    je printValue   
    cmp al, '0'   
    jl takeInput
    cmp al, '9'
    jg checkUpper
    inc cx
    jmp takeInput
    
  checkUpper:
    cmp al, 'A'
    jl takeInput
    cmp al, 'Z'
    jg checkLower
    inc cx
    jmp takeInput
    
  checkLower:
    cmp al, 'a'
    jl takeInput
    cmp al, 'z'
    jg takeInput  ; If not a valid character, continue taking input
    inc cx
    jmp takeInput

  printValue:
    LEA DX, MSG2        
    MOV AH, 9            
    INT 21H 
    
    ; Convert cx to ASCII and print
    add cx, '0'    ; Convert to ASCII
   
    
    ; Move to the next line
    MOV DL, Cl
    MOV AH, 2
    INT 21H
   

    ; Exit the program
    MOV AH, 4CH
    INT 21H              
    
MAIN ENDP
END MAIN
