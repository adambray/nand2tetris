// push constant 1111
@1111
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 123
@123
D=A
@SP
A=M
M=D
@SP
M=M+1

// pop LCL 0
@0
D=A
@LCL
D=M+D
@R14
M=D
@SP
AM=M-1
D=M
@R14
A=M
M=D

// push LCL 0
@0
D=A
@LCL
A=M+D
D=M
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

