.model small   
.stack 100h    
.data           
.code           
main proc   
        
    ; Read a character from the user.
    MOV AH, 01     ; Function code for Read Character from Standard Input.
    INT 21h        ; Trigger interrupt 21h to read a character.
    SUB AL, 30h    ; Convert the ASCII character to a numeric value (e.g., '1' to 1).
  CASE_AL:
    ; Check the value in AL and display "o" for 1 or 3, and "e" for 2 or 4.
    CMP AL, 1
    JE IsOne
    CMP AL, 3
    JE IsOne
    CMP AL, 2
    JE IsTwo
    CMP AL, 4
    JE IsTwo       

    JMP EndCase
  IsOne:
    ; Display "o" for AL containing 1 or 3.
    MOV DL, 'o'
    JMP DisplayChar
  IsTwo:
    ; Display "e" for AL containing 2 or 4.
    MOV DL, 'e'
    JMP DisplayChar
  DisplayChar:
    ; Display the character in DL.
    MOV AH, 02  ; Set AH to 02h, indicating we want to print a character.
    INT 21h     ; Trigger interrupt 21h to display the character in DL.
  EndCase:
    
    mov ah, 4ch  ; Set AH to 4Ch, indicating we want to exit the program.
    int 21h      ; Trigger interrupt 21h to exit and return control to DOS.
main endp       ; End of the main procedure.
end main        ; End of the program.