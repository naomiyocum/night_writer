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
      allow(night_reader).to receive(:filename).and_return('./testing_braille.txt')
      expect(night_reader.read_content).to eq("0000..000.000....0.0..0.0.0.0.\n...0...0.....0..0.0....0.....0\n0.00..0...0.......0...00000.0.")
    end
  end
  
  describe '#write_content' do
    it 'writes translated content' do
      allow(night_reader).to receive(:filename).and_return('testing_braille.txt')
      allow(night_reader).to receive(:back_to_eng).and_return('testing_original_message.txt')
      expect(night_reader.write_content).to eq("Created 'testing_original_message.txt' containing 92 characters")
    end
  end
  
  describe '#to_english' do
    it 'translates from Braille to English' do
      expect(night_reader.to_english("0.\n.0\n00")).to eq('z')
      expect(night_reader.to_english("0.\n..\n0.")).to eq('a')
    end
  end
end
