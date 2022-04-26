require 'simplecov'
SimpleCov.start
require 'rspec'
require './lib/convert_braille_to_text'
require 'pry'

describe ConvertBrailleToText do

  it 'exists' do
    night_reader = ConvertBrailleToText.new("braille.txt", "original_message.txt")
    expect(night_reader).to be_a(ConvertBrailleToText)
  end

  it 'can determine number of letters that will be in the message file' do
    night_reader = ConvertBrailleToText.new("braille.txt", "original_message.txt")
    expect(night_reader.num_characters).to eq(11)
  end

  it 'constructs message from arguments' do
    night_reader = ConvertBrailleToText.new("braille.txt", "original_message.txt")
    expect(night_reader.message).to eq("Created 'original_message.txt' containing 11 characters")
  end

  it 'can create a new file and put a message in it' do
    night_reader = ConvertBrailleToText.new("braille.txt", "original_message.txt")
    night_reader.convert
    expect(File.exist?("original_message.txt")).to eq(true)
  end

  it 'can translate braille into characters' do
    night_reader = ConvertBrailleToText.new("braille.txt", "original_message.txt")
    msg = night_reader.convert
    expect(msg).to eq("hello world")
  end

end
