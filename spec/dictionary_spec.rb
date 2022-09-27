require './lib/dictionary'

RSpec.describe Dictionary do
  let(:dictionary) {Dictionary.new}
  
  describe '#initialize' do
    it 'exists' do
      expect(dictionary).to be_a(Dictionary)
    end
  end
  
  describe '#braille' do
    it 'translates from english to braille and braille to english' do
      expect(dictionary.braille['a']).to eq(["0.","..",".."])
      expect(dictionary.braille['n']).to eq(["00",".0","0."])
    end
  end
  
  describe '#english' do
    it 'inverts the braille hash' do
      expect(dictionary.english[["00",".0","0."]]).to eq('n')
      expect(dictionary.english[["0.","..",".."]]).to eq('a')
    end
  end
end
