.model small
.stack 100h
.data
.code
main proc
    MOV CL, 0         ; Initialize CL register to 0
    
FOR_LOOP:
    MOV DL, CL        ; Load the value in CL into DL for printing
    MOV AH, 02        ; Set AH to 02h (DOS function for printing a character)
    INT 21H           ; Trigger interrupt 21h to print the character
    
    CMP CL, 255       ; Compare CL to 255 (loop condition)
    INC CL            ; Increment CL
    JNE FOR_LOOP      ; Jump back to FOR_LOOP if CL is not equal to 255
    
    mov ah, 4Ch       ; Set AH to 4Ch (DOS function for program exit)
    int 21h           ; Trigger interrupt 21h to exit and return control to DOS
    
main endp
end main
