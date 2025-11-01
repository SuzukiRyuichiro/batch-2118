require 'csv'
require_relative '../models/bus'

class BusRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @buses = []
    @next_id = 1
    load_csv
  end

  def all
    @buses
  end

  def create(bus) # Bus instance w/out an id
    # assign the next id
    bus.id = @next_id
    # increment the next id by 1
    @next_id += 1
    @buses << bus
    # save it into the CSV
    save_csv
  end

  def find(id) # integer
    # return an instance of a Bus that has the id given
    @buses.find { |bus| bus.id == id }
  end

  private

  def load_csv
    # Parse the CSV and populate the @buses array
    CSV.foreach(@csv_file_path, headers: true, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      row[:capacity] = row[:capacity].to_i
      row[:route_number] = row[:route_number].to_i
      row[:accessible] = row[:accessible] == 'true'

      @buses << Bus.new(row)
    end

    # Update the next id depending on buses loaded
    # the last bus' id plus 1
    @next_id = @buses.empty? ? 1 : @buses.last.id + 1
  end

  def save_csv
    # open the csv (blank)
    CSV.open(@csv_file_path, 'wb') do |csv|
      # add the header
      csv << %w[id capacity route_number accessible]
      # iterate over the @buses array
      @buses.each do |bus|
        # write row after row
        csv << [bus.id, bus.capacity, bus.route_number, bus.accessible]
      end
    end
  end
end
