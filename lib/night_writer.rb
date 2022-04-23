require 'pry'

class NightWriter

  def initialize(message_file, braille_file)
    @message_filename = message_file
    @braille_filename = braille_file
    @num_characters = num_characters
    puts message
  end

  def message
    message = "Created \'#{@braille_filename}\' containing #{@num_characters} characters"
  end

  def num_characters
    message_file = File.open(@message_filename, "r")
    str = message_file.read.chomp
    # binding.pry
    return str.length
  end

end

# night_writer = NightWriter.new(ARGV[0], ARGV[1])
