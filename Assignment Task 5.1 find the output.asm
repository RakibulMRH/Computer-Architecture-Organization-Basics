.model small
.stack 100h
.data
.code
main proc
mov cx,127 ;initialize number of character 
mov bl,0
print:
mov ah,2 
inc cx 
cmp cx,255 
ja exit 
mov dx,cx 
int 21h 
mov dx,32d; giving space 
int 21h
jmp go
go:
inc bl
cmp bl,10; 10 char per line je nl
jmp print
nl:
mov ah,2
mov dl, 0dh
int 21h
mov dl,0ah
int 21h
mov bl,0
jmp print
exit:
