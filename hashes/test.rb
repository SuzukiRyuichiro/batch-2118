students =     %w[Peter John Mary George Emma]
student_ages = [24, 25, 35, 22, 20]

students.each_with_index do |student, index|
  puts "#{student} is #{student_ages[index]} years old"
end
