module Code
  DEST_CODES = {
    nil => "000",
    "M" => "001",
    "D" => "010",
    "MD" => "011",
    "A" => "100",
    "AM" => "101",
    "AD" => "110",
    "AMD" => "111"
  }

  JUMP_CODES = {
    nil => "000",
    "JGT" => "001",
    "JEQ" => "010",
    "JGE" => "011",
    "JLT" => "100",
    "JNE" => "101",
    "JLE" => "110",
    "JMP" => "111"
  }

  COMP_CODES = {
    "0" => "0101010",
    "1" => "0111111",
    "-1" => "0111010",
    "D" => "0001100",
    "!D" => "0001101",
    "-D" => "0001111",
    "D+1" => "0011111",
    "D-1" => "0001110",
    "A" => "0110000",
    "!A" => "0110001",
    "-A" => "0110011",
    "A+1" => "0110111",
    "A-1" => "0110010",
    "D+A" => "0000010",
    "D-A" => "0010011",
    "A-D" => "0000111",
    "D&A" => "0000000",
    "D|A" => "0010101",
    "M" => "1110000",
    "!M" => "1110001",
    "-M" => "1110011",
    "M+1" => "1110111",
    "M-1" => "1110010",
    "D+M" => "1000010",
    "D-M" => "1010011",
    "M-D" => "1000111",
    "D&M" => "1000000",
    "D|M" => "1010101"
  }
  def self.dest(string)
    DEST_CODES[string]
  end

  def self.jump(string)
    JUMP_CODES[string]
  end

  def self.comp(string)
    COMP_CODES[string]
  end

  def self.dec_to_bin(string)
    num = string.to_i
    bin = num.to_s(2)
    num_zeros = 15 - bin.length
    "0" << ("0" * num_zeros) << bin
  end
end
