// push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1

// eq
@SP
AM=M-1
D=M
A=A-1
D=D-M
@WRITE_TRUE.1
D;JEQ
@SP
A=M-1
M=0
@CONTINUE.1
0;JMP
(WRITE_TRUE.1)
@SP
A=M-1
M=-1
(CONTINUE.1)

// push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1

// eq
@SP
AM=M-1
D=M
A=A-1
D=D-M
@WRITE_TRUE.2
D;JEQ
@SP
A=M-1
M=0
@CONTINUE.2
0;JMP
(WRITE_TRUE.2)
@SP
A=M-1
M=-1
(CONTINUE.2)

// push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1

// eq
@SP
AM=M-1
D=M
A=A-1
D=D-M
@WRITE_TRUE.3
D;JEQ
@SP
A=M-1
M=0
@CONTINUE.3
0;JMP
(WRITE_TRUE.3)
@SP
A=M-1
M=-1
(CONTINUE.3)

// push constant 892
@892
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1

// lt
@SP
AM=M-1
D=M
A=A-1
D=D-M
@WRITE_TRUE.4
D;JGT
@SP
A=M-1
M=0
@CONTINUE.4
0;JMP
(WRITE_TRUE.4)
@SP
A=M-1
M=-1
(CONTINUE.4)

// push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 892
@892
D=A
@SP
A=M
M=D
@SP
M=M+1

// lt
@SP
AM=M-1
D=M
A=A-1
D=D-M
@WRITE_TRUE.5
D;JGT
@SP
A=M-1
M=0
@CONTINUE.5
0;JMP
(WRITE_TRUE.5)
@SP
A=M-1
M=-1
(CONTINUE.5)

// push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1

// lt
@SP
AM=M-1
D=M
A=A-1
D=D-M
@WRITE_TRUE.6
D;JGT
@SP
A=M-1
M=0
@CONTINUE.6
0;JMP
(WRITE_TRUE.6)
@SP
A=M-1
M=-1
(CONTINUE.6)

// push constant 32767
@32767
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1

// gt
@SP
AM=M-1
D=M
A=A-1
D=D-M
@WRITE_TRUE.7
D;JLT
@SP
A=M-1
M=0
@CONTINUE.7
0;JMP
(WRITE_TRUE.7)
@SP
A=M-1
M=-1
(CONTINUE.7)

// push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 32767
@32767
D=A
@SP
A=M
M=D
@SP
M=M+1

// gt
@SP
AM=M-1
D=M
A=A-1
D=D-M
@WRITE_TRUE.8
D;JLT
@SP
A=M-1
M=0
@CONTINUE.8
0;JMP
(WRITE_TRUE.8)
@SP
A=M-1
M=-1
(CONTINUE.8)

// push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1

// gt
@SP
AM=M-1
D=M
A=A-1
D=D-M
@WRITE_TRUE.9
D;JLT
@SP
A=M-1
M=0
@CONTINUE.9
0;JMP
(WRITE_TRUE.9)
@SP
A=M-1
M=-1
(CONTINUE.9)

// push constant 57
@57
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 31
@31
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 53
@53
D=A
@SP
A=M
M=D
@SP
M=M+1

// add
@SP
A=M-1
D=M
A=A-1
M=D+M
@SP
M=M-1

// push constant 112
@112
D=A
@SP
A=M
M=D
@SP
M=M+1

// sub
@SP
A=M-1
D=M
A=A-1
M=M-D
@SP
M=M-1

// neg
@SP
A=M-1
M=-M

// and
@SP
AM=M-1
D=M
A=A-1
D=D&M
M=D

// push constant 82
@82
D=A
@SP
A=M
M=D
@SP
M=M+1

// or
@SP
AM=M-1
D=M
A=A-1
D=D|M
M=D

// not
@SP
A=M-1
M=!M

