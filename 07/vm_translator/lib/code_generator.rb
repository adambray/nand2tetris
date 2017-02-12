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
  M=-M
  NEG

  EQ = <<~EQ_CODE
  // eq
  @SP
  AM=M-1
  D=M
  A=A-1
  D=D-M
  @WRITE_TRUE
  D;JEQ
  @SP
  A=M-1
  M=0
  @CONTINUE
  0;JMP
  (WRITE_TRUE)
  @SP
  A=M-1
  M=-1
  (CONTINUE)
  EQ_CODE

  LT = <<~LT_CODE
  // lt
  @SP
  AM=M-1
  D=M
  A=A-1
  D=D-M
  @WRITE_TRUE
  D;JGT
  @SP
  A=M-1
  M=0
  @CONTINUE
  0;JMP
  (WRITE_TRUE)
  @SP
  A=M-1
  M=-1
  (CONTINUE)
  LT_CODE

  GT = <<~GT_CODE
  // gt
  @SP
  AM=M-1
  D=M
  A=A-1
  D=D-M
  @WRITE_TRUE
  D;JLT
  @SP
  A=M-1
  M=0
  @CONTINUE
  0;JMP
  (WRITE_TRUE)
  @SP
  A=M-1
  M=-1
  (CONTINUE)
  GT_CODE

  AND = <<~AND
  // and
  @SP
  AM=M-1
  D=M
  A=A-1
  D=D&M
  M=D
  AND

  OR = <<~OR
  // or
  @SP
  AM=M-1
  D=M
  A=A-1
  D=D|M
  M=D
  OR

  NOT = <<~NOT
  // not
  @SP
  A=M-1
  M=!M
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

  def initialize
    @count = 0
  end

  def get_arithmatic(command)
    case command
    when "add"
      ADD
    when "sub"
      SUB
    when "neg"
      NEG
    when "and"
      AND
    when "or"
      OR
    when "not"
      NOT
    when "eq"
      write_eq
    when "lt"
      write_lt
    when "gt"
      write_gt
    end
  end

  def get_push_pop(type, segment, index)
    if type == :C_PUSH && segment == "constant"
      return PUSH_CONSTANT.gsub('VALUE', index)
    end
  end

  private
  def write_eq
    count = get_count
    EQ
      .gsub("WRITE_TRUE", "WRITE_TRUE.#{count}")
      .gsub("CONTINUE", "CONTINUE.#{count}")
  end

  def write_lt
    count = get_count
    LT
      .gsub("WRITE_TRUE", "WRITE_TRUE.#{count}")
      .gsub("CONTINUE", "CONTINUE.#{count}")
  end

  def write_gt
    count = get_count
    GT
      .gsub("WRITE_TRUE", "WRITE_TRUE.#{count}")
      .gsub("CONTINUE", "CONTINUE.#{count}")
  end

  def get_count
    @count += 1
  end
end
