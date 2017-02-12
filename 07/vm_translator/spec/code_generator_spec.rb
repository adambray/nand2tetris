require_relative 'spec_helper'

describe 'CodeGenerator' do
  ADD = 'add'
  SUB = 'sub'
  EQ = 'eq'

  EXPECTED_EQ = <<~EXPECTED_EQ
  // eq
  @SP
  AM=M-1
  D=M
  A=M-1
  D=D-M

  @WRITE_TRUE.1
  D;JEQ
  @SP  // write false
  A=M-1
  M=0
  @CONTINUE.1
  0;JMP
  (WRITE_TRUE.1)
  @SP  // write false
  A=M-1
  M=-1
  (CONTINUE.1)
  EXPECTED_EQ

  before(:each) do
    @generator = get_generator
  end

  describe '#get_arithmatic' do
    it 'returns the correct code as a string for add' do
      result = @generator.get_arithmatic(ADD)
      expect(result).to eq(CodeGenerator::ADD)
    end

    it 'returns the correct code as a string for add' do
      result = @generator.get_arithmatic(SUB)
      expect(result).to eq(CodeGenerator::SUB)
    end

    it 'returns the correct code as a string for add' do
      result = @generator.get_arithmatic(EQ)
      expect(result).to eq(EXPECTED_EQ)
    end
  end

  describe '#get_push_pop' do
    it 'returns the code value for constant' do
      expected = <<~PC5
      // push constant 5
      @5
      D=A
      @SP
      A=M
      M=D
      @SP
      M=M+1
      PC5
      result = @generator.get_push_pop(:C_PUSH, "constant", "5")
      expect(result).to eq(expected)
    end
  end
end

def get_generator
  CodeGenerator.new
end
