require_relative '../meerkat'

describe Meerkat do
  describe '#talk' do
    it 'returns a sentence with its name and it barks' do
      timone = Meerkat.new('Timone')
      expect(timone.talk).to eq('Timone barks')
    end
  end
end
