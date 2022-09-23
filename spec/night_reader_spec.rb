require './lib/night_reader'

RSpec.describe NightReader do
  let(:nightreader) {NightReader.new}
  
  describe '#initialize' do
    it 'exists' do
      expect(nightreader).to be_a(NightReader)
    end
  end
  
  describe '#translate_content' do
    it 'reads CLI input and returns a line' do
      allow(nightreader).to receive(:translate_content).and_return("Created 'original_message.txt' containing 256 characters")
      expect(nightreader.translate_content).to eq("Created 'original_message.txt' containing 256 characters")
    end
  end
end
