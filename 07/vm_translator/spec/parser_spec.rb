require_relative 'spec_helper'

describe 'Parser' do
  BLANK_LINE = "\n".freeze
  COMMENT = '// SOME COMMENT'.freeze
  ADD = 'add'.freeze
  SUB = 'sub'.freeze
  PUSH_5 = 'push constant 5'.freeze

  it 'can be constructed with an IO Object' do
    parser = Parser.new(StringIO.new(''))
  end

  describe '#advance' do
    it 'moves to the next command' do
      parser = get_parser([ADD, SUB])

      expect(parser.arg1).to eq('add')
      parser.advance
      expect(parser.arg1).to eq('sub')
    end

    it 'moves skips comments and empty lines' do
      parser = get_parser([ADD, COMMENT, SUB, COMMENT, SUB])

      expect(parser.arg1).to eq('add')
      parser.advance
      expect(parser.arg1).to eq('sub')
      parser.advance
      expect(parser.arg1).to eq('sub')
    end
  end

  describe '#has_more_commands?' do
    it 'returns true when the file has more commands' do
      parser = get_parser([ADD, ADD, SUB])

      expect(parser.has_more_commands?).to be_truthy
      parser.advance
      expect(parser.has_more_commands?).to be_truthy
      parser.advance
      expect(parser.has_more_commands?).to be_falsey
    end

    it 'returns false if remaining lines are comments or empty' do
      parser = get_parser([ADD, SUB, BLANK_LINE, COMMENT, BLANK_LINE])

      expect(parser.has_more_commands?).to be_truthy
      parser.advance
      expect(parser.has_more_commands?).to be_falsey
    end
  end

  describe '#arg1' do
    it 'returns the correct argument for arithmatic commands' do
      parser = get_parser([ADD, SUB])

      expect(parser.arg1).to eq('add')
      parser.advance
      expect(parser.arg1).to eq('sub')
    end

    it 'returns the correct argument for push commands' do
      parser = get_parser([PUSH_5])

      expect(parser.arg1).to eq("constant")
    end
  end

  describe '#arg2' do
    it 'returns the correct arg for push commands' do
      parser = get_parser([PUSH_5])

      expect(parser.arg2).to eq("5")
    end
  end

  describe '#command_type' do
    it 'returns :c_arithmatic for arithmatic commands' do
      parser = get_parser([ADD, SUB])

      expect(parser.command_type).to eq(:C_ARITHMATIC)
      parser.advance
      expect(parser.command_type).to eq(:C_ARITHMATIC)
    end

    it 'returns :C_PUSH for push commands' do
      parser = get_parser([PUSH_5])

      expect(parser.command_type).to eq(:C_PUSH)
    end
  end


end

def get_parser(commands = [])
  file = StringIO.new
  commands.each do |command|
    file << (command + BLANK_LINE)
  end
  file.rewind
  parser = Parser.new(file)
end
