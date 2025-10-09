def encrypt(string)
  # We need an array of all the alphabet uppercase (for reference)
  # [A,B,C,D,E..]
  alphabets = ('A'..'Z').to_a
  # Prepare an array that is shifted 3 to the left
  # [X,Y,Z,A,B,C...]
  shifted_alphabets = ('X'..'Z').to_a + ('A'..'W').to_a

  # Split the string into an array of characters e.g ['H', 'E', 'L', 'L', 'O']
  characters = string.chars
  # Start iterating over that array of characters (.map) ['H', 'E', 'L', 'L', 'O'] => [E, B, I, I, L]
  shifted_characters = characters.map do |character|
    # on each iteration
    # get the index of the character in the correct alphabet array
    index = alphabets.index(character)
    # use that index to get the shifted character from the shifted array
    # if the index is nil keep it as it is
    index.nil? ? character : shifted_alphabets[index]
  end
  p shifted_characters
  # join the shifted characters into a single string
  shifted_characters.join
end
