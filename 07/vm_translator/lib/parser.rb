class Parser
  def initialize(file)
    @file = file
    @file.rewind
    @lines = file.readlines
    @current_line = 0

    @lines = [''] if @lines.empty?
    advance unless is_statement?
  end

  def advance
    on_last_line = @current_line == @lines.length - 1
    return false if on_last_line

    @current_line += 1
    is_statement? ? (return true) : advance
  end

  def has_more_commands?
    original_line = @current_line
    can_advance = advance
    @current_line = original_line

    can_advance
  end

  def command_type
    if current_command == "add" || current_command == "sub"
      return :C_ARITHMATIC
    end
  end

  def arg1
    return current_command.split(" ").first
  end

  def current_command
    command = @lines[@current_line].chomp.strip
    command
  end

  private

  def is_statement?
    contains_comment = (current_command[0] == '/' && current_command[1] == '/')
    is_empty = current_command == ''

    contains_comment || is_empty ? false : true
  end
end
