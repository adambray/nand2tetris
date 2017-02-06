class Parser
  def initialize(file)
    @file = file
    @lines = file.readlines
    @current_line = 0

    @lines = [""] if @lines.empty?
    advance if !is_statement?
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

    return can_advance
  end

  def command_type
    first_char = current_command[0]

    if first_char == "("
      return :l_command
    elsif first_char == "@"
      return :a_command
    else
      return :c_command
    end
  end

  def symbol
    if command_type == :a_command
      return current_command.gsub("@", "")
    else
      return current_command.gsub(/\(|\)/, "")
    end
  end

  def dest
    command = current_command
    if command.include?("=")
      parts = current_command.split("=")
      return parts.first
    else
      return nil
    end
  end

  def comp
    command = current_command
    if command.include?("=") && command.include?(";")
      return command.split("=").last.split(";").first
    elsif command.include?("=")
      return command.split("=").last
    elsif command.include?(";")
      return command.split(";").first
    else
      return command
    end
  end

  def jump
    command = current_command
    if command.include?(";")
      return command.split(";").last
    else
      return nil
    end
  end

  def current_command
    return @lines[@current_line].chomp.strip
  end

  private
  def is_statement?
    contains_comment = (current_command[0] == "/" && current_command[1] == "/")
    is_empty = current_command == ""

    (contains_comment || is_empty) ? false : true
  end
end
