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
    night_reader = ConvertBrailleToText.new("long_braille.txt", "long_message.txt")
    expect(night_reader.message).to eq("Created 'long_message.txt' containing 47 characters")
  end

  it 'can create a new file and put a message in it' do
    night_reader = ConvertBrailleToText.new("braille.txt", "original_message.txt")
    night_reader.convert
    expect(File.exist?("original_message.txt")).to eq(true)
    expect(File.read("original_message.txt")).to eq("hello world")
  end

  it 'can translate braille into english characters' do
    night_reader = ConvertBrailleToText.new("braille.txt", "original_message.txt")
    msg = night_reader.convert
    expect(msg).to eq("hello world")
  end

  it 'can translate braille longer than 80 characters to english characters' do
    night_reader = ConvertBrailleToText.new("long_braille.txt", "long_message.txt")
    msg = night_reader.convert
    expect(msg).to eq("abcdefghijklmnopqrstuvwxyz this is the alphabet")
  end

  it 'can translate capital letters' do
    night_reader = ConvertBrailleToText.new("capital_braille.txt", "capital_msg.txt")
    msg = night_reader.convert
    expect(msg).to eq("AB")
  end

end
