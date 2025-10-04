price_to_find = rand(1..5)

# initialize the variable so the condition can be checked
guess = 0

# until the guess is exactly the same as price to find
until guess == price_to_find
  puts 'Take a guess how much this cost'
  guess = gets.chomp.to_i
end

puts 'Congrats! you guessed it right!'
