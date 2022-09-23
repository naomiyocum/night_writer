require './lib/night_writer'

RSpec.describe NightWriter do
  let(:night_writer) {NightWriter.new}

  describe '#initialize' do
    it 'exists' do
      expect(night_writer).to be_a(NightWriter)
    end
  end

  describe '#translate_content' do
    it 'reads CLI input and returns a line' do
      allow(night_writer).to receive(:translate_content).and_return("Created 'braille.txt' containing 12 characters")
      expect(night_writer.translate_content).to eq("Created 'braille.txt' containing 12 characters")
    end
  end

  describe '#to_braille' do
    it 'takes in file with English and returns file with Braille characters' do
      expect(night_writer.to_braille('t')).to eq(".0\n00\n0.")
      expect(night_writer.to_braille('u')).to eq("0.\n..\n00")
      expect(night_writer.to_braille('r')).to eq("0.\n00\n0.")
      expect(night_writer.to_braille('i')).to eq(".0\n0.\n..")
      expect(night_writer.to_braille('n')).to eq("00\n.0\n0.")
      expect(night_writer.to_braille('g')).to eq("00\n00\n..")
      
      expect(night_writer.to_braille('turing')).to eq(".00.0..00000\n00..000..000\n0.000...0...")
    end
  end
end
