require './lib/dictionary'

RSpec.describe Dictionary do
  let(:dictionary) {Dictionary.new}
  
  describe '#initialize' do
    it 'exists' do
      expect(dictionary).to be_a(Dictionary)
    end
  end
  
  describe '#meanings' do
    it 'translates from english to braille and braille to english' do
      expect(dictionary.braille['a']).to eq(["0.","..",".."])
      expect(dictionary.braille['n']).to eq(["00",".0","0."])
    end
  end
end
