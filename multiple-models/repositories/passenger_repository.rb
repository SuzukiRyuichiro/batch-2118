require 'csv'
require_relative '../models/passenger'

class PassengerRepository
  def initialize(csv_file_path, bus_repository)
    @csv_file_path = csv_file_path
    @passengers = []
    @next_id = 1
    @bus_repository = bus_repository
    load_csv
  end

  def all
    @passengers
  end

  def create(passenger) # passenger instance w/out an id
    # assign the next id
    passenger.id = @next_id
    # increment the next id by 1
    @next_id += 1
    @passengers << passenger
    # save it into the CSV
    save_csv
  end

  private

  def load_csv
    # Parse the CSV and populate the @passengers array
    CSV.foreach(@csv_file_path, headers: true, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      row[:age] = row[:age].to_i

      passenger = Passenger.new(row)

      # Find the bus that the passenger is on
      bus = @bus_repository.find(row[:bus_id].to_i)
      # assign bus attribute to that passenger
      bus.pickup(passenger)

      @passengers << passenger
    end

    # Update the next id depending on passengeres loaded
    # the last passenger' id plus 1
    @next_id = @passengers.empty? ? 1 : @passengers.last.id + 1
  end

  def save_csv
    # open the csv (blank)
    CSV.open(@csv_file_path, 'wb') do |csv|
      # add the header
      csv << %w[id name age]
      # iterate over the @passengers array
      @passengers.each do |passenger|
        # write row after row
        csv << [passenger.id, passenger.name, passenger.age]
      end
    end
  end
end
