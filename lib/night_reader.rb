require_relative 'braille_converter'

if ARGV.length != 2
  puts "must provide two text file names as arguments"
  exit
elsif !File.exist?(ARGV[0])
  puts "must provide existing text file for first argument"
  exit
end
braille_to_text = BrailleConverter.new(ARGV[0], ARGV[1])
puts braille_to_text.message
