        CPU "Z80.TBL"
        HOF "INT8"

        LD A,(1000H)
        LD B,A
        CALL OBTCAS
        CALL MITAD
        LD L,0
        LD C,1
        LD IX,1001H
        CALL ACTUALIZAR
PUTNUM: LD (IX+0),C
        INC C
AVANZAR: INC H
        DEC L
        CALL ACTUALIZAR
        LD E,B ; COMIENZA A APLICAR REGLAS
        DEC E
        LD A,H
        CP E
        JP M,SALTAR2
        JP Z,SALTAR2
        LD A,L
        CP 0
        JP P,SALTAR2
        DEC H
        INC L
        INC L
SALTAR2: LD E,B ;SEGUNDA REGLA
        DEC E
        LD A,H
        CP E
        JP M,SALTAR3
        JP Z,SALTAR3
        LD H,0
        JP SALTAR5
SALTAR3: LD A,L
        CP 0
        JP P,SALTAR4
        LD L,E
        JP SALTAR5
SALTAR4: LD A,(IX+0)
         CP 0
         JP Z,SALTAR5
         DEC H
         INC L
         INC L
SALTAR5: CALL ACTUALIZAR
        LD A,D
        CP C
        JP P,PUTNUM
        HALT
        
ACTUALIZAR: LD IX,1001H
        LD A,H
        CP 0
        JP Z,SALTO 
        JP P,INCIXH
REG1:   DEC IX ;INICIA DECIXH
        INC A
        JP NZ,REG1
SALTO:  LD A,0
        LD E,B
MULT:   ADD A,L
        DEC E
        JP NZ, MULT
        CP 0
        JP Z,REGRESAR
        JP P,INCIXL
REG2:   DEC IX ;INICIA DECIXL
        INC A
        JP NZ,REG2
REGRESAR: RET
INCIXH: INC IX
        DEC A
        JP NZ,INCIXH
        JP SALTO
INCIXL: INC IX
        DEC A
        JP NZ,INCIXL
        JP REGRESAR

OBTCAS: LD E,B
        LD A,0
MULOC:  ADD A,B
        DEC E
        JP NZ,MULOC
        LD D,A
        RET

MITAD: LD A,B
       DEC A
ETI1:  CP 2
       JP Z,ETI2
       SUB 2
       INC C
       JP ETI1
ETI2:  INC C       
ETI4:  LD H,C
       RET

       