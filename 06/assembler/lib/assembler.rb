class Assembler
  def initialize(in_file, out_file, parser_klass)
    @in_file = in_file
    @out_file = out_file
    @parser = parser_klass.new(@in_file)
  end

  def assemble
    loop do
      command_type = @parser.command_type
      if command_type == :a_command
        result = Code.dec_to_bin(@parser.symbol)
      elsif command_type == :c_command
        result = "111"
        result << Code.comp(@parser.comp)
        result << Code.dest(@parser.dest)
        result << Code.jump(@parser.jump)
      end

      @out_file << result << NEW_LINE

      break if !@parser.has_more_commands?
      @parser.advance
    end
  end
end
