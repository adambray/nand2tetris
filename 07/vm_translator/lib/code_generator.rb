class CodeGenerator
  ADD = <<~ADD
  // add
  @SP
  A=M-1
  D=M
  A=A-1
  M=D+M
  @SP
  M=M-1
  ADD

  SUB = <<~SUB
  // sub
  @SP
  A=M-1
  D=M
  A=A-1
  M=M-D
  @SP
  M=M-1
  SUB

  NEG = <<~NEG
  // neg
  @SP
  A=M-1
  D=-M
  A=A-1
  M=D
  @SP
  M=M-1
  NEG

  EQ = <<~EQ_CODE
  // neg
  @SP
  AM=M-1
  D=M
  A=M-1
  D=D-M

  @WRITE_TRUE
  D;JEQ
  @SP  // write false
  A=M-1
  M=0
  @CONTINUE
  0;JMP
  (WRITE_TRUE)
  @SP  // write false
  A=M-1
  M=-1
  (CONTINUE)
  EQ_CODE

  LT = <<~LT
  LT

  GT = <<~GT
  GT

  AND = <<~AND
  AND

  OR = <<~OR
  OR

  NOT = <<~NOT
  NOT

  PUSH_CONSTANT = <<~PC
  // push constant VALUE
  @VALUE
  D=A
  @SP
  A=M
  M=D
  @SP
  M=M+1
  PC

  def self.get_arithmatic(command)
    case command
    when "add"
      ADD
    when "sub"
      SUB
    end
  end

  def self.get_push_pop(type, segment, index)
    if type == :C_PUSH && segment == "constant"
      return PUSH_CONSTANT.gsub('VALUE', index)
    end
  end
end
