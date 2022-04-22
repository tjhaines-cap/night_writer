

class NightWriter

  def initialize()
    @braille_filename = "braille.txt"
    @num_characters = 256
    puts message
  end

  def message
    message = "Created \'#{@braille_filename}\' containing #{@num_characters} characters"
  end

end

night_writer = NightWriter.new
