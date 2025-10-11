paris = {
  'country' => 'France',
  'population' => 2211000,
  'mayor' => nil
}

# read values using the key
p paris['language']

# Adding a key value pair
paris["star_monument"] = "Effiel Tower"

p paris

# Updating the value
paris["population"] = 2211001

p paris

# delete a key value pair

paris.delete('star_monument')

p paris


# .each

paris.each do |key, value|
  puts "Paris' #{key} is #{value}"
end

# Some other methods

paris.key?("country")   #=> true
paris.key?("language")  #=> false
paris.keys              #=> ["country", "population", "star_monument"]
paris.values            #=> ["France", 2211000, "Tour Eiffel"]


# symbols

"string"
'string'

:symbol

# We could write it like this
tokyo = {
  "population" => 23000000,
  "country" => "Japan"
}

# But we prefer
tokyo = {
  :population => 23000000,
  :country => "Japan"
}

# matsuyama = {
#   :population => 500000,
#   :country => "Japan"
# }

matsuyama = {
  population: 500000,
  country: "Japan"
}

p matsuyama[:country]
