require_relative 'dictionaries/text_to_braille'
require_relative 'dictionaries/braille_to_text'
require 'pry'

class ConvertBrailleToText

  attr_reader :num_characters

  def initialize(braille_file, message_file)
    @braille_filename = braille_file
    @message_filename = message_file
    @braille_file = File.open(@braille_filename, "r")
    @braille_msg_arr = @braille_file.readlines.map(&:chomp)
    @braille_file.close
    @num_characters = number_english_characters
    @conversion_table = Dictionaries::BRAILLE_TO_TEXT
  end

  def number_english_characters
    braille_chars = 0
    @braille_msg_arr.each do |line|
      braille_chars += line.length
    end
    num_characters = braille_chars / 6
  end

  def message
    "Created \'#{@message_filename}\' containing #{@num_characters} characters"
  end

  def convert
      message_file = File.open(@message_filename, "w")
      str = ""
      num_lines_of_text = @braille_msg_arr.length / 3
      for i in 0..(num_lines_of_text - 1)
        start_line = i * 3
        #convert braille by rows of three from the text file
        str += convert_lines(@braille_msg_arr[start_line..(start_line+2)])
      end
      message_file.write(str)
      message_file.close
      return str
  end

  def convert_lines(braille_lines)
    str = ""
    # go from 0 to the length of the brialle_lines in increments of 2
    next_letter_is_capital = false
    (0..(braille_lines[0].length - 1)).each_slice(2) do |indices|
      braille_letter = []
      #Take two elements from each of the three arrays in braill_lines to construct braille_letter
      braille_lines.each do |braille_line|
        braille_letter << [braille_line[indices[0]],braille_line[indices[1]]]
      end
      if next_letter_is_capital
        str += @conversion_table[braille_letter].upcase
        next_letter_is_capital = false
      elsif @conversion_table[braille_letter] == "shift"
        next_letter_is_capital = true
      else
        str += @conversion_table[braille_letter]
      end
    end
    return str
  end

end
