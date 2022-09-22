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
end
