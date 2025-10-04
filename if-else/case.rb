puts 'Which action would you like?'

action = gets.chomp

case action
when 'read'
  puts 'you are now in READ mode'
when 'write'
  puts 'you are now in WRITE mode'
when 'delete'
  puts 'you are now in DELETE mode'
else
  puts 'please enter a valid action'
end
