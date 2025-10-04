puts 'What is your age??'

age = gets.chomp.to_i

if age >= 18
  puts 'You can vote!'
else
  puts 'You cannot vote!'
end

# Ternary operator

# puts age >= 18 ? 'You can vote' : 'You cannot vote'
