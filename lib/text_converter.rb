class TextConverter

  def initialize(message_file, braille_file)
    @message_filename = message_file
    @braille_filename = braille_file
    @message_file = File.open(@message_filename, "r")
    @message_str = @message_file.read.chomp
    @num_characters = message_length
  end

  def message
    message = "Created \'#{@braille_filename}\' containing #{@num_characters} characters"
  end

  def message_length
    @message_str.length
  end

end
