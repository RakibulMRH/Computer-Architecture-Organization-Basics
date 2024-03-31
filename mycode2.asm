.model small
 .stack 100h
.data
 CR EQU '0DH'
 LF EQU '0AH'
 MSg1 DB 'DO NOT STOP $'
 MSG2 DB 'STOP$'
 .code
 main proc
 mov ax,@data;
 mov ds,ax;
 mov cx, 7h;
 print:
 lea dx, MSG1;
 mov ah,9d
 
 int 21h;
mov ah,2;
mov dl,0dh;
int 21h;
mov dl,0ah;
int 21h;
dec cx;
jnz print
mov ah,2;
mov dl,0dh;
int 21h;
mov dl,0ah;
int 21h;
lea dx,MSG2;
mov ah,9;
 int 21h;
exit:
lea dx,MSG2;
mov ah,9;
 int 21h;
mov ah,4ch;
int 21h;
main endp
end main