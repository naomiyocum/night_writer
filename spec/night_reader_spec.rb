require './lib/night_reader'

RSpec.describe NightReader do
  let(:night_reader) {NightReader.new}
  
  describe '#initialize' do
    it 'exists' do
      expect(night_reader).to be_a(NightReader)
    end
  end
  
  describe '#read_content' do
    it 'reads content from the file' do
      allow(night_reader).to receive(:filename).and_return('./spec/spec_files/testing_braille.txt')
      expect(night_reader.read_content).to eq("000.0.\n...0.0\n0.0.0.")
    end
  end
  
  describe '#write_content' do
    it 'writes translated content' do
      allow(night_reader).to receive(:filename).and_return('./spec/spec_files/testing_braille.txt')
      allow(night_reader).to receive(:back_to_eng).and_return('./spec/spec_files/testing_original_message.txt')
      expect(night_reader.write_content).to eq("Created './spec/spec_files/testing_original_message.txt' containing 20 characters")
    end
  end
  
  describe '#split_to_lines' do
    it 'splits braille into separate lines' do
      expect(night_reader.split_to_lines("000.0.0.\n...0.00.\n..0.0.0.")).to eq([["000.0.0.", "...0.00.", "..0.0.0."]])
    end
  end
  
  describe '#split_to_letters' do
    it 'splits the lines into separate braille letters' do
      expected = [[["00", "0.", "0.", "0."], ["..", ".0", ".0", "0."], ["..", "0.", "0.", "0."]]]
      expect(night_reader.split_to_letters("000.0.0.\n...0.00.\n..0.0.0.")).to eq(expected)
    end
  end
  
  describe '#to_english' do
    it 'translates from Braille to English' do
      expect(night_reader.to_english("0.\n.0\n00")).to eq('z')
      expect(night_reader.to_english("0.\n..\n0.")).to eq('k')
  
      expect(night_reader.to_english("000.0.\n...0.0\n0.0.0.")).to eq('moo')
    end
  end
  
  
end
