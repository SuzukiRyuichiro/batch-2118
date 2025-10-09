require_relative '../encrypt'

describe '#encrypt' do
  it 'returns an empty string when an empty string is given' do
    expect = ''
    actual = encrypt('')

    expect(actual).to eq(expect)
  end

  it 'shifts each characters three letters to the left when a sentence is given' do
    # "HELLO"
    expect = 'EBIIL'
    actual = encrypt('HELLO')
    expect(actual).to eq(expect)
  end

  it 'shifts each characters for a long sentence (avoiding spaces)' do
    actual = encrypt('THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG')
    expected = 'QEB NRFZH YOLTK CLU GRJMP LSBO QEB IXWV ALD'
    expect(actual).to eq(expected)
  end
end
