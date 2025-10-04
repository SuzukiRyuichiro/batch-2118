price_to_find = rand(1..5)

# initialize the variable so the condition can be checked
guess = 0

# while the user's guess is wrong, repeat asking for the new guess
while guess != price_to_find
  puts 'Take a guess how much this cost'
  guess = gets.chomp.to_i
end

puts 'Congrats! you guessed it right!'

