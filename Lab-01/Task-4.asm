ORG 0100h

.DATA
    Celsius DW 260
    Fahrenheit DW ?

.CODE
MAIN PROC
    MOV AX, Celsius
    MOV BX, 10

    MUL BX
    DIV 5
    ADD AX, 32
    SUB AX, 1
    
    MOV Fahrenheit, AX

MAIN ENDP
END MAIN
RET
