      CPU "Z80.TBL"
      HOF "INT8"
      LD A,(1000H)
      LD E,A
      CP 0
      JP Z,FIN
      LD IX, 1001H
ETI5: LD C,E
      LD B,E
ETI2: LD A,(IX+1)
      LD H,A
      LD A,(IX+0)
      CP H
      JP M,ETI1
      JP Z,ETI1
      LD (IX+0),H
      LD (IX+1),A
ETI1: INC IX
      DEC C
      LD A,C
      CP 1
      JP NZ,ETI2
      DEC IX
ETI4: LD A,(IX+1)
      LD H,A
      LD A,(IX+0)
      CP H
      JP M,ETI3
      JP Z,ETI3
      LD (IX+0),H
      LD (IX+1),A
ETI3: DEC IX
      DEC B
      LD A,B
      CP 1
      JP NZ,ETI4
      DEC E
      LD A,E
      CP 1
      JP Z,FIN
      INC IX                                                  
      JP ETI5
FIN:  HALT
