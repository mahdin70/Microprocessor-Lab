ORG 0100h

.DATA
    result3 DW ?

.CODE
MAIN PROC
    MOV AX, 0FFFh
    MOV BX, 10h

    MUL BX
    ADD AX, 1111b

    MOV result3, AX

MAIN ENDP
END MAIN
RET
