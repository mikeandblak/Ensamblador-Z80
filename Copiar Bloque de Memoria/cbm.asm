        CPU "Z80.TBL"
        HOF "INT8"

        LD L,0;CONTADOR
        LD A,(1000H)
        LD B,A;CARGA TAM BLOQUE
        LD A,(1001H)
        LD C,A;CARGA TAM CADENA
        LD IX,1002H;CARGA INICIO CAD
        LD IY,1020H;CARGA INICIO BLOQ
        PUSH IY
ETI3:   LD A,(IY+0);OBTIENE EL VALOR DE MEM
        CP 0
        JP Z,ETI1
        POP DE
        INC IY
        DEC B
        LD A,B
        CP C
        JP Z,ETI2
        PUSH IY
        JP P,ETI3
ETI2:   HALT
ETI1:   INC IY
        INC L
        LD A,L
        CP C
        JP NZ,ETI3
        POP IY
ETI4:   LD D,(IX+0)
        LD (IY+0), D
        DEC C
        LD A,C
        CP 0
        JP Z,ETI2
        INC IY
        INC IX
        JP ETI4