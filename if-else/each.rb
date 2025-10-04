beatles = %w[john ringo george paul yoko]

beatles.each do |member|
  capitalized_name = member.capitalize
  puts "#{capitalized_name} is a member of the Beatles"
end

# for member in beatles
#   capitalized_name = member.capitalize
#   puts "#{capitalized_name} is a member of the Beatles"
# end
