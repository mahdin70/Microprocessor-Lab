ORG 0100h

.DATA
    result DW ?

.CODE
MAIN PROC
    MOV AL, 0Bh
    MOV BL, 200
    SUB BL, 225

    MUL BL
    ADD AL, 127

    MOV result, AX

MAIN ENDP
END MAIN
RET
