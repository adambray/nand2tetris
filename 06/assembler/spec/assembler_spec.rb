require 'spec_helper'
TEST_PROGRAMS_WITHOUT_SYMBOLS = ["Add", "MaxL", "RectL", "PongL"]
TEST_PROGRAMS = ["Max", "Rect", "Pong"]

describe "Assembler" do
  describe "Without Symbols" do
    it "assembles programs correctly" do
      TEST_PROGRAMS_WITHOUT_SYMBOLS.each do |program|
        input_path = File.expand_path("../../test/without_symbols/#{program}.asm", __FILE__)
        expected_output_path = File.expand_path("../../test/without_symbols/#{program}Expected.hack", __FILE__)
        expected_output_file = File.open(expected_output_path)
        out_string = StringIO.new("")

        File.open(input_path) do |in_file|
          assembler = Assembler.new(in_file, out_string, Parser, SymbolTable)
          assembler.assemble
          expect(out_string.string).to eq(expected_output_file.readlines.join)
        end
      end
    end
  end

  describe "With Symbols" do
    it "assembles programs correctly" do
      TEST_PROGRAMS.each do |program|
        input_path = File.expand_path("../../test/with_symbols/#{program}.asm", __FILE__)
        expected_output_path = File.expand_path("../../test/with_symbols/#{program}Expected.hack", __FILE__)
        expected_output_file = File.open(expected_output_path)
        out_string = StringIO.new("")

        File.open(input_path) do |in_file|
          assembler = Assembler.new(in_file, out_string, Parser, SymbolTable)
          assembler.assemble
          expect(out_string.string).to eq(expected_output_file.readlines.join)
        end
      end
    end
  end

end
