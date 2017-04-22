;       Copyright (C) 2015
;       Rojas Hernandez Miguel Alejandro <>
;       Oropeza Vilchis Luis Alberto <vilchissfi@gmail.com>
;
;       This program is free software: you can redistribute it and/or modify
;       it under the terms of the GNU General Public License as published by
;       the Free Software Foundation, either version 3 of the License, or
;	(at your option) any later version.
;
;	This program is distributed in the hope that it will be useful,
;	but WITHOUT ANY WARRANTY; without even the implied warranty of
;	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;	GNU General Public License for more details.
;
;	You should have received a copy of the GNU General Public License
;	along with this program.  If not, see <http://www.gnu.org/licenses/>.
    
    
    CPU "Z80.TBL"
    HOF "INT8"

      LD IY,1020H
      LD E,0
      LD A,(1000H)
      LD B,A
ETI6: LD A,(1001H)
      LD C,A
      LD A,B

      CP 0
      JP Z,ETI7
      LD IX,1002H
      PUSH IY
ETI3: LD A,(IY+0)
      LD D,A
      LD A,(IX+0)
      CP D

      JP NZ,ETI1
      DEC B
      DEC C
      INC IX
      INC IY
      LD A,C
      CP 0
      JP Z,ETI2
      JP ETI3

ETI2: INC E
      JP eti6
ETI7: LD A,E
      CP 0
      JP Z,ETI4

      LD IX,2000H
      LD (IX+0),E
ETI5: INC IX

      POP HL
      LD (IX+0),H
      LD (IX+1),L
      INC IX
      DEC A

      CP 0

      JP NZ,ETI5
ETI4: HALT

ETI1: INC IY

      DEC B
      POP HL
      JP ETI6



