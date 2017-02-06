require 'spec_helper'

DEFAULT_SYMBOLS = {
  "SP" => 0,
  "LCL" => 1,
  "ARG" => 2,
  "THIS" => 3,
  "THAT" => 4,
  "R0" => 0,
  "R1" => 1,
  "R2" => 2,
  "R3" => 3,
  "R4" => 4,
  "R5" => 5,
  "R6" => 6,
  "R7" => 7,
  "R8" => 8,
  "R9" => 9,
  "R10" => 10,
  "R11" => 11,
  "R12" => 12,
  "R13" => 13,
  "R14" => 14,
  "R15" => 15,
  "SCREEN" => 16384,
  "KBD" => 24576
}

describe 'Code' do
  describe '#add/#contains' do
    it 'returns false if the symbol has not been added' do
      table = SymbolTable.new
      expect(table.contains?("testing")).to be_falsey
    end

    it 'returns false if the symbol has not been added' do
      table = SymbolTable.new
      table.add("testing", 6)
      expect(table.contains?("testing")).to be_truthy
    end

    it 'returns true for built-in symbols' do
      table = SymbolTable.new

      DEFAULT_SYMBOLS.each do |symbol, value|
        expect(table.contains?(symbol)).to be_truthy
      end
    end
  end

  describe '#get_address' do
    it 'returns addresses of symbols previously set' do
      table = SymbolTable.new
      table.add("first", 19)
      table.add("second", 20)
      expect(table.get_address("first")).to eq(19)
      expect(table.get_address("second")).to eq(20)
    end

    it 'returns addresses of built-in symbols' do
      table = SymbolTable.new

      expect(table.get_address("SP")).to eq(0)
      expect(table.get_address("LCL")).to eq(1)
      expect(table.get_address("R10")).to eq(10)
      expect(table.get_address("SCREEN")).to eq(16384)
      expect(table.get_address("KBD")).to eq(24576)
    end
  end
end
