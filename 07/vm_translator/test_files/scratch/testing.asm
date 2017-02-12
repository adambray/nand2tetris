// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 1111
@1111
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 2222
@2222
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1

// neg
@SP
A=M-1
M=-M

// push constant 3333
@3333
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 5
@5
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 4
@4
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

// push constant 4444
@4444
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 5
@5
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 4
@4
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

// push constant 5555
@5555
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 5
@5
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 5
@5
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

// push constant 5
@5
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 6
@6
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

// push constant 6666
@6666
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 5
@5
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 6
@6
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
@WRITE_TRUE.3
D;JGT
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

// push constant 7
@7
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 6
@6
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

// push constant 7777
@7777
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 19
@19
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 6
@6
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

// push constant 7
@7
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 60
@60
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

// push constant 8888
@8888
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 19
@19
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 6
@6
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

// push constant 7
@7
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 60
@60
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

// push constant 9999
@9999
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 1
@1
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

// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1

// not
@SP
A=M-1
M=!M

// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// not
@SP
A=M-1
M=!M

// push constant 257
@257
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 129
@129
D=A
@SP
A=M
M=D
@SP
M=M+1

// and
@SP
AM=M-1
D=M
A=A-1
D=D&M
M=D

// push constant 123456
@123456
D=A
@SP
A=M
M=D
@SP
M=M+1

