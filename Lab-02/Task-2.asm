ORG 100h

.DATA   

.CODE
MAIN PROC   

    MOVE_TO_FRONT_UPPER:          
        SUB BL,27
        CMP BL,0
        JG FORWARD_LOOP
               
    MOVE_TO_FRONT_LOWER:
        SUB BL,27
        CMP BL,0
        JG FORWARD_UPPER_LOOP
        
     MOVE_TO_BACK_UPPER:          
        ADD BL,27
        CMP BL,0
        JG BACKWARD_LOOP
        
               
    MOVE_TO_BACK_LOWER:
        ADD BL,27
        CMP BL,0
        JG BACKWARD_UPPER_LOOP
                      
    MOV BX,0
    
    MOV AH,1
    INT 21h
    MOV BL,AL      
               
    ;NEW LINE:    
    MOV AH,2
    MOV DL,0DH
    INT 21h
    MOV DL,0AH
    INT 21h
    
    ;COMPARE UPPER OR LOWER
    CMP BL,97
    JGE LOWER_TO_UPPER
    
    ;DEFINE UPPER_TO_LOWER
    UPPER_TO_LOWER:
        ADD BL,32
        MOV AL,10
        CMP AL,5
        JGE COMPLETE_UPPER
    
    ;DEFINE LOWER_TO_UPPER
    LOWER_TO_UPPER:
        SUB BL,32
        
               
    ;CHECK FOR LOWER_CASE LETTERS AS INPUT
    COMPLETE_LOWER:     
        ;MOVE FORWARD
        MOV CX,0
        FORWARD_LOOP:
            ADD BL,1
            
            CMP BL,90
            JG MOVE_TO_FRONT_UPPER 
            
            MOV DL,BL 
            MOV AH,2
            INT 21h 
            ADD CL,1
            CMP CL,5
            JL FORWARD_LOOP
        
        ;ADD A NEW LINE
        MOV AH,2
        MOV DL,0DH
        INT 21h
        MOV DL,0AH
        INT 21h            
        
        
        ;MOVE BACKWARD
        MOV CX,0
        SUB BL,5
        BACKWARD_LOOP:
            SUB BL,1
            
            CMP BL,65
            JL MOVE_TO_BACK_UPPER
            
            MOV DL,BL 
            MOV AH,2
            INT 21h 
            ADD CL,1
            CMP CL,5
            JL BACKWARD_LOOP
            CMP BL,0
            JG EXIT
           
    ;CHECK FOR UPPER_CASE LETTERS AS INPUT
    COMPLETE_UPPER:     
        ;MOVE FORWARD
        MOV CX,0
        FORWARD_UPPER_LOOP:
            ADD BL,1
            
            CMP BL,122
            JG MOVE_TO_FRONT_LOWER 
            
            MOV DL,BL 
            MOV AH,2
            INT 21h 
            ADD CL,1
            CMP CL,5
            JL FORWARD_UPPER_LOOP
        
        ;ADD A NEW LINE
        MOV AH,2
        MOV DL,0DH
        INT 21h
        MOV DL,0AH
        INT 21h            
          
        ;MOVE BACKWARD
        MOV CX,0
        SUB BL,5
        BACKWARD_UPPER_LOOP:
            SUB BL,1    
            CMP BL,97
            JL MOVE_TO_BACK_LOWER
            
            MOV DL,BL 
            MOV AH,2
            INT 21h 
            ADD CL,1
            CMP CL,5
            JL BACKWARD_UPPER_LOOP
            CMP BL,0
            JG EXIT 
        
        ;RETURN TO DOS
        EXIT:
            MOV AH,4CH
            INT 21h 
        
    HLT
  
MAIN ENDP
END MAIN
RET
