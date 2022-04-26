require 'pry'
require_relative 'convert_text_to_braille'

if ARGV.length != 2
  puts "must provide two text file names as arguments"
  exit
elsif !File.exist?(ARGV[0])
  puts "must provide existing text file for first argument"
  exit
end
text_to_braille = ConvertTextToBraille.new(ARGV[0], ARGV[1])
text_to_braille.convert_message
puts text_to_braille.message
