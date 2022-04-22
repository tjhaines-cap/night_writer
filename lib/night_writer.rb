

class NightWriter

  def initialize(mes, br)
    @braille_filename = br
    @num_characters = 256
    puts message
  end

  def message
    message = "Created \'#{@braille_filename}\' containing #{@num_characters} characters"
  end

end

night_writer = NightWriter.new(ARGV[0], ARGV[1])
