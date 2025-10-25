require_relative '../animal'

describe Animal do
  describe '#initialize' do
    it 'creates an Animal instance' do
      animal = Animal.new('Gary')
      # If the animal is actually an instance of Animal
      expect(animal).to be_an(Animal)
    end
  end

  describe '#name' do
    it 'returns the name of the animal' do
      animal = Animal.new('Gary')
      expect(animal.name).to eq('Gary')
    end
  end

  describe '::phyla' do
    it 'return an array of all phyla of the world' do
      actual = Animal.phyla
      expected = %w[Porifera Cnidaria Platyhelminthes Nematoda Annelida Arthropoda Mollusca
                    Echinodermata Chordata]

      expect(actual).to eq(expected)
    end
  end

  describe '#eat' do
    it 'returns the sentence with the name and the food it ate' do
      gary = Animal.new('Gary')
      expect(gary.eat('donut')).to eq('Gary eats a donut.')
    end
  end
end
