require_relative '../lion'

describe Lion do
  describe '#talk' do
    it 'returns a sentence with its name and it roars' do
      renato = Lion.new('Renato')
      expect(renato.talk).to eq('Renato roars')
    end
  end

  describe '#eat' do
    it 'returns the sentence with the name and the food it ate, plus Law of the jungle!' do
      simba = Lion.new('Simba')
      expect(simba.eat('gazelle')).to eq('Simba eats a gazelle. Law of the jungle!')
    end
  end
end
