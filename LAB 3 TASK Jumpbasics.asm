.model small   ; Set the memory model to "small."

.stack 100h     ; Reserve 256 bytes (100h in hexadecimal) for the stack.

.data           ; Start the data section.

MSG db 0DH, 0AH, "Hello World$"  ; Define a null-terminated string "WELCOME!!".

.code           ; Start the code section.

main proc       ; Begin the main procedure.

    MOV AX,DATA ; Load the data segment value into AX.
    MOV DS, AX  ; Set DS to the value in AX, pointing to the data segment.
    REPEAT:
    LEA DX, MSG  ; Load the effective address of the MSG variable into DX.
    MOV AH,09    ; Set AH to 09h, indicating we want to use DOS "Print String" function.
    INT 21H      ; Trigger interrupt 21h (DOS function call) to print the string.
    JMP REPEAT    
        
    ; Return to DOS
    mov ah, 4ch  ; Set AH to 4Ch, indicating we want to exit the program.
    int 21h      ; Trigger interrupt 21h to exit and return control to DOS.

main endp       ; End of the main procedure.

end main        ; End of the program.
