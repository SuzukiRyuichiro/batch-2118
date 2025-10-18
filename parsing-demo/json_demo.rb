require 'json'

# TODO: - let's read/write data from beatles.json
filepath = 'data/beatles.json'

json_text = File.read(filepath) # string

JSON.parse(json_text) # hash

# pp parsed_json

# Get first name of the Second member of the beatles
# p parsed_json['beatles'][10]['first_name']
# p parsed_json.dig('beatles', 10, 'first_name')

# Write into JSON

beatles = {
  beatles: [
    {
      first_name: 'John',
      last_name: 'Lennon',
      instrument: 'Guitar'
    },
    {
      first_name: 'Paul',
      last_name: 'McCartney',
      instrument: 'Bass Guitar'
    }
  ]
}

File.open(filepath, 'wb') do |file|
  file.write(JSON.generate(beatles))
end
