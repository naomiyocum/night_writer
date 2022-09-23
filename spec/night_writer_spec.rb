require './lib/night_writer'

RSpec.describe NightWriter do
  let(:night_writer) {NightWriter.new}

  describe '#initialize' do
    it 'exists' do
      expect(night_writer).to be_a(NightWriter)
    end
  end
  
  describe '#read_content' do
    it 'reads content from the file' do
      allow(night_writer).to receive(:filename).and_return('./testing_file.txt')
      expect(night_writer.read_content).to eq("my name is zuko\n")
    end
  end
  
  describe '#write_content' do
    it 'writes translated content' do
      allow(night_writer).to receive(:filename).and_return('./testing_file.txt')
      allow(night_writer).to receive(:translated_file).and_return('testing_braille.txt')
      expect(night_writer.write_content).to eq("Created 'testing_braille.txt' containing 16 characters")
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
