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

  PUSH_LOCAL = <<~PUSH_LOCAL
  // push SEGMENT VALUE
  @VALUE
  D=A
  @SEGMENT
  A=M+D
  D=M
  @SP
  A=M
  M=D
  @SP
  M=M+1
  PUSH_LOCAL

  POP_LOCAL = <<~POP_LOCAL
  // pop SEGMENT VALUE
  @VALUE
  D=A
  @SEGMENT
  D=M+D
  @R14
  M=D
  @SP
  AM=M-1
  D=M
  @R14
  A=M
  M=D
  POP_LOCAL

  PUSH_TEMP = <<~PUSH_TEMP
  // push temp ADDRESS
  @ADDRESS
  D=M
  @SP
  A=M
  M=D
  @SP
  M=M+1
  PUSH_TEMP

  POP_TEMP = <<~POP_TEMP
  // pop temp ADDRESS
  @SP
  AM=M-1
  D=M
  @ADDRESS
  M=D
  POP_TEMP

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
      write_comp("eq")
    when "lt"
      write_comp("lt")
    when "gt"
      write_comp("gt")
    end
  end

  def get_push_pop(type, segment, index)
    simple_segments = { "local" => "LCL",
                        "argument" => "ARG",
                        "this" => "THIS",
                        "that" => "THAT"}
    temp_index = (5 + index.to_i).to_s
    if type == :C_PUSH && segment == "constant"
      return PUSH_CONSTANT.gsub('VALUE', index)
    elsif type == :C_PUSH && simple_segments.keys.include?(segment)
      return PUSH_LOCAL.gsub('SEGMENT', simple_segments[segment]).gsub('VALUE', index)
    elsif type == :C_PUSH && segment == 'temp'
      return PUSH_TEMP.gsub('ADDRESS', temp_index)
    elsif type == :C_POP && simple_segments.keys.include?(segment)
      return POP_LOCAL.gsub('SEGMENT', simple_segments[segment]).gsub('VALUE', index)
    elsif type == :C_POP && segment == 'temp'
      return POP_TEMP.gsub('ADDRESS', temp_index)
    end
  end

  private
  def write_comp(type)
    count = get_count
    comps = {"eq" => EQ, "lt" => LT, "gt" => GT}
    code = comps[type]

    code
      .gsub("WRITE_TRUE", "WRITE_TRUE.#{count}")
      .gsub("CONTINUE", "CONTINUE.#{count}")
  end

  def get_count
    @count += 1
  end
end
