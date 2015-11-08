         CPU "Z80.TBL"
         HOF "INT8" 

        LD A,(1000H)
        LD B,A
        CALL FIBONACCI
        LD IX, 1001H
        LD (IX+0),D
        HALT

FIBONACCI: LD A,B
           CP 2
           JP Z,SUMAR
           CP 1
           JP Z,REGRESAR
           DEC B
           PUSH BC
           CALL FIBONACCI
           POP BC
           DEC B
           CALL FIBONACCI
REGRESAR: RET
SUMAR: INC D
       JP REGRESAR
