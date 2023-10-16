.model small   ; Set the memory model to "small."

.stack 100h     ; Reserve 256 bytes (100h in hexadecimal) for the stack.

.data           ; Start the data section.

MSG1 db 0DH, 0AH, "Hello World!$"  ; Define a null-terminated string.    

MSG2 db 0DH, 0AH, "Bye World!$"  ; Define a null-terminated string.  

.code           ; Start the code section.

main proc       ; Begin the main procedure.

    MOV AX,DATA ; Load the data segment value into AX.
    MOV DS, AX  ; Set DS to the value in AX, pointing to the data segment.
    MOV CX, 10   ; Set count for loop

   
 REPEAT:
    LEA DX, MSG1  ; Load the effective address of the MSG variable into DX.
    MOV AH,09    ; Set AH to 09h, indicating we want to use DOS "Print String" function.
    INT 21H      ; Trigger interrupt 21h (DOS function call) to print the string.
    DEC CX      ; DECREAMENT THE CX VALUE FOR EACH LOOP
    CMP CX,0    
    
    JG REPEAT    ;JUMP IF COMPARE IS GRATER
    
    JNE BYE; 
           
    
    BYE:
       
    LEA DX, MSG2  ; Load the effective address of the MSG variable into DX.
    MOV AH,09    ; Set AH to 09h, indicating we want to use DOS "Print String" function.
    INT 21H      ; Trigger interrupt 21h (DOS function call) to print the string.
    INC CX      ;
    CMP CX,3  
    JL BYE
    JNE END;     
    
    END:
       
    ; Return to DOS
    mov ah, 4ch  ; Set AH to 4Ch, indicating we want to exit the program.
    int 21h      ; Trigger interrupt 21h to exit and return control to DOS.

main endp       ; End of the main procedure.
end main        ; End of the program.