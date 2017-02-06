require_relative 'lib/parser'
require_relative 'lib/code'

NEW_LINE = "\n"

in_file_name = ARGV[0]
out_file_name = in_file_name.gsub(".asm", ".hack")

File.open(in_file_name) do |in_file|
  File.open(out_file_name, "w") do |out_file|
    parser = Parser.new(in_file)
    line_number = 1

    loop do
      command_type = parser.command_type
      if command_type == :a_command
        result = Code.dec_to_bin(parser.symbol)
      elsif command_type == :c_command
        result = "111"
        result << Code.comp(parser.comp)
        result << Code.dest(parser.dest)
        result << Code.jump(parser.jump)
      elsif command_type == :comment
        line_number += 1
        parser.advance
        next
      elsif command_type == :empty
        line_number += 1
        parser.advance
        next
      end

      out_file << result << NEW_LINE

      break if !parser.has_more_commands?
      parser.advance
      line_number += 1
    end
  end
end
