require_relative 'dictionaries/text_to_braille'
require_relative 'dictionaries/braille_to_text'
require 'pry'

class ConvertTextToBraille

  attr_reader :num_characters

  def initialize(message_file, braille_file)
    @message_filename = message_file
    @braille_filename = braille_file
    @message_file = File.open(@message_filename, "r")
    @message_str = @message_file.read.chomp
    @message_file.close
    @num_characters = number_english_characters
    @conversion_table = Dictionaries::TEXT_TO_BRAILLE
  end

  def message
    message = "Created \'#{@braille_filename}\' containing #{@num_characters} characters"
  end

  def number_english_characters
    @message_str.length
  end

  def breakup_message(message)
    message_lines = []
    num_columns = 0
    start_index = 0
    end_index = 0
    message.each_char do |char|
      if char == char.downcase || char == " "
        num_columns += 2
      elsif char == char.upcase
        num_columns += 4
      end
      if (num_columns == 80) || (end_index == (message.length - 1))
        message_lines << message[start_index..end_index]
        start_index = end_index + 1
        num_columns = 0
      end
      end_index += 1
    end
    return message_lines
  end

  def convert_message
    braille_file = File.open(@braille_filename, "w")
    str = ""
    message_by_line = breakup_message(@message_str)
    message_by_line.each do |line|
      str += convert_line(line)
    end
    braille_file.write(str)
    braille_file.close
    return str
  end

  def convert_line(line)
    str = ""
    for r in 0..2
      line.each_char do |char|
        if char == char.capitalize && char != " "
          str += @conversion_table['shift'][r].join
          str += @conversion_table[char.downcase][r].join
        else
          str += @conversion_table[char][r].join
        end
      end
      str += "\n"
    end
    return str
  end

end
