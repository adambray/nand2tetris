require_relative 'spec_helper'

describe 'CodeGenerator' do
  ADD = "add"
  SUB = "sub"

  describe '#get_arithmatic' do
    it 'returns the correct code as a string for add' do
      result = CodeGenerator.get_arithmatic(ADD)
      expect(result).to eq(CodeGenerator::ADD)
    end
    it 'returns the correct code as a string for add' do
      result = CodeGenerator.get_arithmatic(SUB)
      expect(result).to eq(CodeGenerator::SUB)
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
      result = CodeGenerator.get_push_pop(:C_PUSH, "constant", "5")
      expect(result).to eq(expected)
    end
  end
end
