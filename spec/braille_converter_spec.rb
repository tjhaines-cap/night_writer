require 'simplecov'
SimpleCov.start
require 'rspec'
require './lib/braille_converter'
require 'pry'

describe BrailleConverter do

  it 'exists' do
    night_reader = BrailleConverter.new("braille.txt", "original_message.txt")
    expect(night_reader).to be_a(BrailleConverter)
  end

  it 'can determine number of letters that will be in the message file' do
    night_reader = BrailleConverter.new("braille.txt", "original_message.txt")
    expect(night_reader.num_characters).to eq(11)
  end

  xit 'constructs message from arguments' do
    night_reader = BrailleConverter.new("braille.txt", "original_message.txt")
    expect(night_reader.message).to eq("Created 'original_message.txt' containing 11 characters")
  end

end
