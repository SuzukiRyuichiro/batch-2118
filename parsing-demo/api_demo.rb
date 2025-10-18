require 'json'
require 'open-uri'

# TODO: - Let's fetch name and bio from a given GitHub username
url = 'https://api.github.com/users/donald-chow'

user_serialized = URI.parse(url).read

parsed_profile = JSON.parse(user_serialized)

puts "#{parsed_profile['name']} lives in #{parsed_profile['location']}"
