require 'spec_helper'

DEST_CODES = {
  nil => "000",
  "M" => "001",
  "D" => "010",
  "MD" => "011",
  "A" => "100",
  "AM" => "101",
  "AD" => "110",
  "AMD" => "111"
}

JUMP_CODES = {
  nil => "000",
  "JGT" => "001",
  "JEQ" => "010",
  "JGE" => "011",
  "JLT" => "100",
  "JNE" => "101",
  "JLE" => "110",
  "JMP" => "111"
}

COMP_CODES = {
  "0" => "0101010",
  "1" => "0111111",
  "-1" => "0111010",
  "D" => "0001100",
  "!D" => "0001101",
  "-D" => "0001111",
  "D+1" => "0011111",
  "D-1" => "0001110",
  "A" => "0110000",
  "!A" => "0110001",
  "-A" => "0110011",
  "A+1" => "0110111",
  "A-1" => "0110010",
  "D+A" => "0000010",
  "D-A" => "0010011",
  "A-D" => "0000111",
  "D&A" => "0000000",
  "D|A" => "0010101",
  "M" => "1110000",
  "!M" => "1110001",
  "-M" => "1110011",
  "M+1" => "1110111",
  "M-1" => "1110010",
  "D+M" => "1000010",
  "D-M" => "1010011",
  "M-D" => "1000111",
  "D&M" => "1000000",
  "D|M" => "1010101"
}

describe 'Code' do
  describe '.dest' do
    it 'returns the correct binary string for destination' do
      DEST_CODES.each do |string, expected_val|
        expect(Code.dest(string)).to eq(expected_val)
      end
    end
  end

  describe '.jump' do
    it 'returns the correct binary string for destination' do
      JUMP_CODES.each do |string, expected_val|
        expect(Code.jump(string)).to eq(expected_val)
      end
    end
  end

  describe '.comp' do
    it 'returns the correct binary string for destination' do
      COMP_CODES.each do |string, expected_val|
        expect(Code.comp(string)).to eq(expected_val)
      end
    end
  end

  describe '.dec_to_bin' do
    it 'returns the binary representation of a decimal number as 16 bits w/ initial 0' do
      expect(Code.dec_to_bin("0")).to     eq("0000000000000000")
      expect(Code.dec_to_bin("1")).to     eq("0000000000000001")
      expect(Code.dec_to_bin("2")).to     eq("0000000000000010")
      expect(Code.dec_to_bin("4")).to     eq("0000000000000100")
      expect(Code.dec_to_bin("256")).to   eq("0000000100000000")
      expect(Code.dec_to_bin("16384")).to eq("0100000000000000")
      expect(Code.dec_to_bin("32767")).to eq("0111111111111111")
    end
  end
end
