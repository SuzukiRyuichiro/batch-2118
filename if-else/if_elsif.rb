hour = 23

if hour < 12
  puts 'good morning!'
elsif hour > 22
  puts "it's late, have a good night."
elsif hour > 12
  puts 'good afternoon!'
else
  puts "It's lunch time!"
end
