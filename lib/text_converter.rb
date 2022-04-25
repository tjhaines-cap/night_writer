require_relative 'dictionaries/text_to_braille'
require_relative 'dictionaries/braille_to_text'
require 'pry'

class ConvertTextToBraille
  # def self.call(*args)
  #   new(*args).call
  # end

  def initialize(message_file, braille_file)
    @message_filename = message_file
    @braille_filename = braille_file
    @message_file = File.open(@message_filename, "r")
    @message_str = @message_file.read.chomp
    @message_file.close
    @num_characters = message_length
    @conversion_table = Dictionaries::TEXT_TO_BRAILLE
  end
  # private_class_method :new

  def message
    message = "Created \'#{@braille_filename}\' containing #{@num_characters} characters"
  end

  # private

  def message_length
    @message_str.length
  end

  def convert
    braille_file = File.open(@braille_filename, "w")
    total_lines = @num_characters / 40
    str = ""
    for line_num in 0..total_lines
      start = line_num * 40
      str += convert_line(@message_str[start..(start + 39)])
    end
    braille_file.write(str)
    braille_file.close
    return str
  end

  def convert_line(line)
    str = ""
    for r in 0..2
      line.each_char do |char|
        str += @conversion_table[char][r].join
      end
      str += "\n"
    end
    return str
  end

end
