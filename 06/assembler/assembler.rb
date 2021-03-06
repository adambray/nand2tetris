require_relative 'lib/parser'
require_relative 'lib/code'
require_relative 'lib/symbol_table'
require_relative 'lib/assembler'

in_file_name = ARGV[0]
out_file_name = in_file_name.gsub(".asm", ".hack")

File.open(in_file_name) do |in_file|
  File.open(out_file_name, "w") do |out_file|
    assembler = Assembler.new(in_file, out_file, Parser, SymbolTable)
    assembler.assemble
  end
end
