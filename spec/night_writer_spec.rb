require 'simplecov'
SimpleCov.start
require 'rspec'
require './lib/night_writer'


describe NightWriter do

  it 'exists' do
    night_writer = NightWriter.new("message.txt", "braille.txt")
    expect(night_writer).to be_a(NightWriter)
  end

  it 'constructs message to output from given arguments' do
    night_writer = NightWriter.new("message.txt", "braille.txt")
    expect(night_writer.message).to eq("Created 'braille.txt' containing 256 characters")
    night_writer = NightWriter.new("randon.txt", "other.txt")
    expect(night_writer.message).to eq("Created 'other.txt' containing 256 characters")
  end

end
