class Assembler
  NEW_LINE = "\n"

  def initialize(in_file, out_file, parser_klass, symbol_klass)
    @in_file = in_file
    @out_file = out_file
    @parser_klass = parser_klass
    @table = symbol_klass.new
    @current_mem_address = 16
  end

  def assemble
    build_symbol_table(@parser_klass.new(@in_file))
    assemble_code(@parser_klass.new(@in_file))
  end

  private
  def build_symbol_table(parser)
    output_line_number = 0

    loop do
      command_type = parser.command_type
      if (command_type == :a_command || command_type == :c_command)
        output_line_number += 1
      elsif command_type == :l_command
        @table.add(parser.symbol, output_line_number)
      end

      break if !parser.has_more_commands?
      parser.advance
    end
  end

  def assemble_code(parser)
    loop do
      command_type = parser.command_type
      if command_type == :a_command
        symbol = parser.symbol
        @out_file << build_a_command(symbol) << NEW_LINE
      elsif command_type == :c_command
        @out_file << build_c_command(parser.comp, parser.dest, parser.jump) << NEW_LINE
      end

      break if !parser.has_more_commands?
      parser.advance
    end
  end

  def build_a_command(symbol)
    if symbol.to_i.to_s == symbol # symbol is numeric
      return Code.dec_to_bin(symbol)
    else
      if @table.contains?(symbol) # symbol is a variable already in table
        mem_address = @table.get_address(symbol)
        return Code.dec_to_bin(mem_address)
      else # symbol is a new variable
        @table.add(symbol, @current_mem_address)
        result = Code.dec_to_bin(@current_mem_address)
        @current_mem_address += 1
        return result
      end
    end
  end

  def build_c_command(comp, dest, jump)
    result = "111"
    result << Code.comp(comp)
    result << Code.dest(dest)
    result << Code.jump(jump)
  end
end
