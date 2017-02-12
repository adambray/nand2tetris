class VMTranslator
  NEW_LINE = "\n"
  attr_reader :parser, :code_generator

  def initialize(in_file, out_file, parser_klass, code_generator)
    @in_file = in_file
    @out_file = out_file
    @parser = parser_klass.new(@in_file)
    @code_generator = code_generator.new
  end

  def translate
    loop do
      command_type = parser.command_type
      if command_type == :C_ARITHMATIC
        @out_file << code_generator.get_arithmatic(parser.arg1) << NEW_LINE
      elsif command_type == :C_PUSH
        @out_file << code_generator.get_push_pop(:C_PUSH, parser.arg1, parser.arg2) << NEW_LINE
      end

      break if !parser.has_more_commands?
      parser.advance
    end
  end
end
