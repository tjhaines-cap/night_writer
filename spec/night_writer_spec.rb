require 'simplecov'
SimpleCov.start
require 'rspec'
require './lib/night_writer'


describe NightWriter do

  it 'exists' do
    night_writer = NightWriter.new
    expect(night_writer).to be_a(NightWriter)
  end

  it 'constructs message to output' do
    night_writer = NightWriter.new
    expect(night_writer.message).to eq("Created 'braille.txt' containing 256 characters")
  end

end
