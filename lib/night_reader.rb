require_relative 'convert_braille_to_text'

if ARGV.length != 2
  puts "must provide two text file names as arguments"
  exit
elsif !File.exist?(ARGV[0])
  puts "must provide existing text file for first argument"
  exit
end
braille_to_text = ConvertBrailleToText.new(ARGV[0], ARGV[1])
braille_to_text.convert
puts braille_to_text.message
