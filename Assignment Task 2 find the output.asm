
.model small
.stack 100h
.data
.code
main proc
mov al,97
mov cl,al
mov ah,2
mov dl,cl
int 21h
sub al,32
exit:
mov ah,2
mov dl,al
int 21h
mov ah,4ch
int 21h
main endp
end main