# The shop is open from 8am to 2pm and then from 6pm to 11pm

hour = 24

if (hour >= 8 && hour <= 14) || (hour >= 18 && hour <= 23)
  puts "We're open"
else
  puts "We're closed"
end
