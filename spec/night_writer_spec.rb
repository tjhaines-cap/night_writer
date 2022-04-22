require 'simplecov'
SimpleCov.start
require 'rspec'
require './lib/night_writer'


describe NightWriter do

  it 'exists' do
    night_writer = NightWriter.new
    expect(night_writer).to be_a(NightWriter)
  end

end
