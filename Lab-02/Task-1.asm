ORG 100h 

.DATA 

.CODE 
MAIN PROC 
    MOV AH, 1    
    INT 21h          
    MOV BL, AL      

    MOV AH, 2     
    MOV DL, 0DH    
    INT 21h     
    MOV DL, 0AH      
    INT 21h       

   
    CMP BL, 97   ; Compare if the character is lowercase (ASCII code >= 97)
    JGE UPPERCASE_CONVERSION ; Jump to uppercase conversion if true

    LOWERCASE_TO_UPPERCASE:
        ADD BL, 32     
        ; Convert lowercase to uppercase by adding 32 
        
        JMP COMPLETE_EXECUTION

    UPPERCASE_CONVERSION:
        SUB BL, 32 
        ; Convert uppercase to lowercase by subtracting 32

    COMPLETE_EXECUTION:
        MOV DL, BL      ; Move the converted character to DL
        INT 21h         ; Call DOS interrupt to output the character

        MOV AH, 4Ch      ; Function code for program termination
        INT 21h          ; Call DOS interrupt to terminate the program

        HLT

MAIN ENDP
END MAIN 
RET 
