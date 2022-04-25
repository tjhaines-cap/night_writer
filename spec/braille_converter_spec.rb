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

end
