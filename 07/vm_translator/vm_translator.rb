require_relative 'lib/code_generator'
require_relative 'lib/parser'
require_relative 'lib/vm_translator'

in_file_name = ARGV[0]
out_file_name = in_file_name.gsub(".vm", ".asm")

File.open(in_file_name) do |in_file|
  File.open(out_file_name, "w") do |out_file|
    translator = VMTranslator.new(in_file, out_file, Parser, CodeGenerator)
    translator.translate
  end
end
