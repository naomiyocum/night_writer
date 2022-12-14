require './lib/night_writer'

RSpec.describe NightWriter do
  let(:night_writer) {NightWriter.new}

  describe '#initialize' do
    it 'exists' do
      expect(night_writer).to be_a(NightWriter)
    end
  end
  
  describe '#write_content' do
    it 'writes translated content' do
      allow(night_writer).to receive(:filename).and_return('./spec/spec_files/testing_file.txt')
      allow(night_writer).to receive(:translated_file).and_return('./spec/spec_files/testing_braille.txt')
      expect(night_writer.write_content).to eq("Created './spec/spec_files/testing_braille.txt' containing 3 characters")
    end
  end
  
  describe '#split_string' do
    it 'splits a string into separate letters' do
      expected = ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"]
      expect(night_writer.split_string('hello world')).to eq(expected)
    end
  end
  
  describe '#split_lines' do
    it 'separates braille letters into designated lines' do
      expected = [[["0", ".", ".", "0"]], [["0", "0", "0", "."]], [[".", ".", ".", "."]]]
      expect(night_writer.split_lines('hi')).to eq(expected)
      expected = [[[".", "0", "0", ".", ".", "0"]], [["0", "0", ".", "0", "0", "0"]], [[".", "0", "0", ".", ".", "0"]]]
      expect(night_writer.split_lines('wow')).to eq(expected)
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
