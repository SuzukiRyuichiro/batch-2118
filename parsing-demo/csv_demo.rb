require 'csv'

# TODO: - let's read/write data from beatles.csv
filepath = 'data/beatles.csv'

CSV.foreach(filepath, headers: :first_row) do |row|
  # John Lennon plays Guitar
  puts "#{row['First Name']} #{row['Last Name']} plays #{row['Instrument']}"
end

# Saving

CSV.open(filepath, 'wb') do |csv|
  # Rewrite everything row by row
  csv << ['First Name', 'Last Name', 'Instrument']
  csv << %w[John Lennon Guitar]
  csv << ['Paul', 'McCartny', 'Bass Guitar']
end
