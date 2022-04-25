require_relative 'dictionaries/text_to_braille'
require_relative 'dictionaries/braille_to_text'

class ConvertBrailleToText

  attr_reader :num_characters

  def initialize(braille_file, message_file)
    @braille_filename = braille_file
    @message_filename = message_file
    @braille_file = File.open(@braille_filename, "r")
    @braille_data = @braille_file.readlines
    @num_characters = message_length
  end

  def message_length
    braille_chars = 0
    @braille_data.each do |line|
      braille_chars += line.length
    end
    num_characters = braille_chars / 6
  end

  def message
    "Created \'#{@message_filename}\' containing #{@num_characters} characters"
  end

  def convert
      message_file = File.open(@message_filename, "w")
      message_file.write(@braille_data)
  end


end