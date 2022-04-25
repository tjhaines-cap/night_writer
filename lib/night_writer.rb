require 'pry'
require_relative 'text_converter'

# message_file = File.open(ARGV[0], "r")
# message_str = message_file.read.chomp
text_converter = TextConverter.new(ARGV[0], ARGV[1])
puts text_converter.message
# puts "Created \'#{ARGV[1]}\' containing #{num_chars} characters"
