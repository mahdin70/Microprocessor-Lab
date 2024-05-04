org 100h
.DATA
.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    XOR CX, CX
    
    MOV CX, 50
    MOV AH, 2
    MOV DL, '*'
    
    TOP: INT 21H
    LOOP TOP
    
    MOV AH,4CH
    INT 21H
    
MAIN ENDP
END MAIN

RET