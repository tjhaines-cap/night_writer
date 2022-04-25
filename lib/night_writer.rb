require 'pry'

# night_writer = NightWriter.new(ARGV[0], ARGV[1])
message_file = File.open(ARGV[0], "r")
message_str = message_file.read.chomp
num_chars = message_str.length
puts "Created \'#{ARGV[1]}\' containing #{num_chars} characters"
