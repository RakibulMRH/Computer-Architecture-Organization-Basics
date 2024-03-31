.model small
.stack 100h
.data
m0 dW 'I know magic. $'
m1 dW 'Magician found $'
m2 dW 'YES.$'
m3 dW 'Do you know magic? $'
.code
main proc
MOV AX,@DATA
MOV DS,AX
MOV AX,5H
MOV BX,2H
CMP AX,BX
MOV AH,9
LEA DX,M3
INT 21H
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h
JGE A1

A1:
MOV AH,9
LEA DX, M2
INT 21H
INT 21H
JMP EXIT
MOV AH,9
LEA DX, M1
INT 21H
EXIT:
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h
MOV AH,9
LEA DX,M0
INT 21H
MOV AH,4CH
INT 21H
MAIN ENDP
END MAIN
