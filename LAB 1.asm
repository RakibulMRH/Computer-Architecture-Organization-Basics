.model small;
.stack 100h;
.data
.code
main proc
    ;display promt
    MOV AH,2
    MOV DL,'?'
    INT 21H    
    
    MOV AH,1
    INT 21H
    mov bl,al      
    
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h    
    
    ;display character
    mov dl,bl
    int 21h
    
    ;return to dos
    mov ah, 4ch
    int 21h 
    
main ENDP 
    