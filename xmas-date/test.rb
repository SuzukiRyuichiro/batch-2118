require_relative 'xmas'

# test the method if the returning number is as expected.

actual = xmas
puts actual
expected = 84

if actual == expected
  puts 'passed!'
else
  puts 'failed :('
end
