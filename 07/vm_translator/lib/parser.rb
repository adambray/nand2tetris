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
    arithmatic_commands = ['add', 'sub', 'neg', 'eq', 'lt', 'gt', 'and', 'or', 'not']
    if arithmatic_commands.include?(current_command)
      :C_ARITHMATIC
    elsif current_command.split(' ').first == 'push'
      :C_PUSH
    elsif current_command.split(' ').first == 'pop'
      :C_POP
    end
  end

  def arg1
    case command_type
    when :C_ARITHMATIC
      current_command.split(' ').first
    when :C_PUSH
      current_command.split(' ')[1]
    when :C_POP
      current_command.split(' ')[1]
    end
  end

  def arg2
    case command_type
    when :C_PUSH
      current_command.split(' ')[2]
    when :C_POP
      current_command.split(' ')[2]
    end
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
