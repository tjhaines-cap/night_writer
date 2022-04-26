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

  def convert
    braille_file = File.open(@braille_filename, "w")
    str = ""
    #Make each line 40 english characters and convert one line at a time to braille
    total_lines = @num_characters / 40
    for line_num in 0..total_lines
      start_index = line_num * 40
      str += convert_line(@message_str[start_index..(start_index + 39)])
    end
    braille_file.write(str)
    braille_file.close
    return str
  end

  def new_convert
    braille_file = File.open(@braille_filename, "w")
    str = ""
    original_str = @message_str
    start_char_substr = 0
    num_chars_translated = 0
    r = 0
    while r <= 2
      new_str = ""
      row_num_characters = 0
      original_str.each_char do |char|
        if (char == char.capitalize) && (char != " ")
          new_str += @conversion_table['shift'][r].join
          new_str += @conversion_table[char.downcase][r].join
          row_num_characters += 1
        else
          new_str += @conversion_table[char][r].join
          row_num_characters += 1
        end
        if (new_str.length == 80) || (row_num_characters == original_str.length)
          str += new_str
          str += "\n"
          if r == 2
            num_chars_translated += row_num_characters
            original_str = original_str[(num_chars_translated)..-1]
            start_char_substring = num_chars_translated
          end
          break
        end
      end
      if (r == 2) && (num_chars_translated < @num_characters)
        r = 0
      else
        r += 1
      end
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
