.model small
.stack 100h
.data
m0 db 'I know magic. $'
ml db 'Magician found $'
m2 db 'YES.$'
m3 db 'Do you know magic? $'
.code
main proc
    MOV AX, @DATA
    MOV DS, AX
    MOV AX, 5
    MOV BX, 2
    CMP AX, BX
    MOV AH, 9
    LEA DX, m3
    INT 21H
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
    JGE A1
A1:
    MOV AH, 9
    LEA DX, m2
    INT 21H
    INT 21H
    JMP EXIT
EXIT:
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
    MOV AH, 9
    LEA DX, m0
    INT 21H
    MOV AH, 4CH
    INT 21H
main endp
END MAIN
