require 'simplecov'
SimpleCov.start
require 'rspec'
require './lib/text_converter'


describe TextConverter do

  it 'exists' do
    night_writer = TextConverter.new("message_test.txt", "braille.txt")
    expect(night_writer).to be_a(TextConverter)
  end

  it 'constructs message to output from given arguments' do
    night_writer = TextConverter.new("message_test.txt", "braille.txt")
    expect(night_writer.message).to eq("Created 'braille.txt' containing 11 characters")
    night_writer = TextConverter.new("message_test.txt", "other.txt")
    expect(night_writer.message).to eq("Created 'other.txt' containing 11 characters")
  end

end
