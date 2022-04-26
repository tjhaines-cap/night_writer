require 'simplecov'
SimpleCov.start
require 'rspec'
require './lib/convert_text_to_braille'
require 'pry'


describe ConvertTextToBraille do

  it 'exists' do
    night_writer = ConvertTextToBraille.new("message_test.txt", "braille.txt")
    expect(night_writer).to be_a(ConvertTextToBraille)
  end

  it 'constructs message to output from given arguments' do
    night_writer = ConvertTextToBraille.new("message_test.txt", "braille.txt")
    expect(night_writer.message).to eq("Created 'braille.txt' containing 11 characters")
    night_writer = ConvertTextToBraille.new("message_test.txt", "other.txt")
    expect(night_writer.message).to eq("Created 'other.txt' containing 11 characters")
  end

  it 'can create new file and put message in it' do
    night_writer = ConvertTextToBraille.new("message_test.txt", "braille.txt")
    night_writer.convert
    expect(File.exist?("braille.txt")).to eq(true)
    expect(File.read("braille.txt")).to eq("0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n")
  end

  it 'can translate characters into braille' do
    night_writer = ConvertTextToBraille.new("message_test.txt", "braille.txt")
    braille_msg = night_writer.convert
    expect(braille_msg).to eq("0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n")
  end

  it 'can translate a line longer than 40 characters and format correctly' do
    night_writer = ConvertTextToBraille.new("long_message_test.txt", "long_braille.txt")
    braille_msg = night_writer.convert
    expect(braille_msg.index("\n")).to eq(80)
  end

end
