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

  it 'can determine number of letters in the message file' do
    night_reader = ConvertTextToBraille.new("long_message_test.txt", "braille.txt")
    expect(night_reader.num_characters).to eq(47)
  end

  it 'constructs message to output from given arguments' do
    night_writer = ConvertTextToBraille.new("message_test.txt", "braille.txt")
    expect(night_writer.message).to eq("Created 'braille.txt' containing 11 characters")
    night_writer = ConvertTextToBraille.new("message_test.txt", "other.txt")
    expect(night_writer.message).to eq("Created 'other.txt' containing 11 characters")
  end

  it 'can break up message into lines that will correspond with braille' do
    night_writer = ConvertTextToBraille.new("message_test.txt", "braille.txt")
    message = "This Will Take Up One Line braille This will be on the next line"
    expect(night_writer.breakup_message(message)).to eq(["This Will Take Up One Line braille", " This will be on the next line"])
  end

  it 'can create new file and put message in it' do
    night_writer = ConvertTextToBraille.new("message_test.txt", "braille.txt")
    night_writer.new_convert
    expect(File.exist?("braille.txt")).to eq(true)
    expect(File.read("braille.txt")).to eq("0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n")
  end

  it 'can translate characters into braille' do
    night_writer = ConvertTextToBraille.new("message_test.txt", "braille.txt")
    braille_msg = night_writer.new_convert
    expect(braille_msg).to eq("0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n")
  end

  it 'can translate a line longer than 40 characters and format correctly' do
    night_writer = ConvertTextToBraille.new("long_message_test.txt", "long_braille.txt")
    braille_msg = night_writer.new_convert
    expect(braille_msg[0..80]).to eq("0.0.00000.00000..0.00.0.00000.00000..0.00.0..000000....00..0.0...0.0...00.0...0.\n")
    expect(braille_msg[81..161]).to eq("..0....0.00.00000.00..0....0.00.00000.00..0.00...0.0..00000.0...0.0...0000.0....\n")
    expect(braille_msg[162..242]).to eq("....................0.0.0.0.0.0.0.0.0.0.0000.0000000..0.....0.....0...0.........\n")
    expect(braille_msg[243..257]).to eq("0.000.0.0.0..0\n")
    expect(braille_msg[258..272]).to eq("0.0.00..0..000\n")
    expect(braille_msg[273..287]).to eq("0.0.........0.\n")
  end

  it 'can translate capital letters' do
    night_writer = ConvertTextToBraille.new("capital.txt", "capital_braille.txt")
    braille_msg = night_writer.new_convert
    expect(braille_msg).to eq("..0...0.\n......0.\n.0...0..\n")
  end


  it 'can translate more than 40 capital and lowercase letters' do
    night_writer = ConvertTextToBraille.new("long_capital.txt", "long_capital_braille.txt")
    braille_msg = night_writer.new_convert
    expect(braille_msg[0..80]).to eq("0.0.00000.00000..0.00.0.00000.00000..0.00.0..000000...0...0...00..00..0...00..00\n")
    expect(braille_msg[243..319]).to eq("..0....0...0..0...0...00..00..0...00..00..0....0...0..0...0....0..00..00..0.\n")
  end

end
