ORG 0100h 

.DATA 
result DW ?

.CODE
MAIN PROC 
    MOV AL, 30 
    ADD AL, 15 

    MOV AX, 575
    SUB AX, 225

    MUL AX 
    ADD AX, 210 
 
    MOV result, AX

MAIN ENDP 
END MAIN 
RET
