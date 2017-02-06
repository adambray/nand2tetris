require 'spec_helper'
require_relative '../lib/parser'

C_COMMAND = "D=D+1;JEQ\n"
A_COMMAND = "@ABC\n"
L_COMMAND = "(Loop)\n"
COMMENT = "// adasd\n"
BLANK_LINE = "\n\n"

describe 'Parser' do
  it 'can be constructed with a file/stringIO instance' do
    stringIO = StringIO.new("")
    paser = Parser.new(stringIO)
  end

  describe '#commandType' do
    it 'returns the correct type as a symbol' do
      parser = get_parser([A_COMMAND])
      expect(parser.command_type).to eq(:a_command)

      parser = get_parser([C_COMMAND])
      expect(parser.command_type).to eq(:c_command)

      parser = get_parser([L_COMMAND])
      expect(parser.command_type).to eq(:l_command)
    end
  end

  describe '#has_more_commands?' do
    it 'returns true when the file has more commands' do
      parser = get_parser([A_COMMAND, C_COMMAND, L_COMMAND])

      expect(parser.has_more_commands?).to be_truthy
      parser.advance
      expect(parser.has_more_commands?).to be_truthy
      parser.advance
      expect(parser.has_more_commands?).to be_falsey
    end
  end

  describe '#advance' do
    it 'moves to the next command' do
      parser = get_parser([A_COMMAND, C_COMMAND, L_COMMAND])

      expect(parser.command_type).to eq(:a_command)
      parser.advance
      expect(parser.command_type).to eq(:c_command)
      parser.advance
      expect(parser.command_type).to eq(:l_command)
    end
  end

  describe '#symbol' do
    it 'returns the correct value' do
      parser = get_parser([A_COMMAND, L_COMMAND])

      expect(parser.symbol).to eq("ABC")

      parser.advance
      expect(parser.symbol).to eq("Loop")
    end
  end

  describe '#dest' do
    it 'returns nil when no destination' do
      parser = get_parser(["D+1;JMP"])
      expect(parser.dest).to eq(nil)
    end

    it 'returns the correct value when present' do
      parser = get_parser(["D=D+1;JMP"])
      expect(parser.dest).to eq("D")

      parser = get_parser(["AMD=D+1;JMP"])
      expect(parser.dest).to eq("AMD")
    end
  end

  describe '#comp' do
    it 'returns the correct value for comp' do
      parser = get_parser(["D=D+1;JMP"])
      expect(parser.comp).to eq("D+1")

      parser = get_parser(["AMD=D+1"])
      expect(parser.comp).to eq("D+1")

      parser = get_parser(["AMD=0;JLE"])
      expect(parser.comp).to eq("0")

      parser = get_parser(["AMD=-1"])
      expect(parser.comp).to eq("-1")

      parser = get_parser(["AMD=-M"])
      expect(parser.comp).to eq("-M")

      parser = get_parser(["D|M"])
      expect(parser.comp).to eq("D|M")
    end
  end

  describe '#jump' do
    it 'returns the correct value for jump' do
      parser = get_parser(["D=D+1;JMP"])
      expect(parser.jump).to eq("JMP")

      parser = get_parser(["AMD=D+1"])
      expect(parser.jump).to eq(nil)

      parser = get_parser(["AMD=0;JLE"])
      expect(parser.jump).to eq("JLE")

      parser = get_parser(["AMD=-1"])
      expect(parser.jump).to eq(nil)
    end
  end
end

def get_parser(commands = [])
  file = StringIO.new
  commands.each do |command|
    file << command
  end
  file.rewind
  parser = Parser.new(file)
end
