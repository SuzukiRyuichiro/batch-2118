require_relative 'bus_repository'
require_relative 'passenger_repository'

buses_csv_file_path = File.join(__dir__, '../data/buses.csv')
bus_repo = BusRepository.new(buses_csv_file_path)

passengers_csv_file_path = File.join(__dir__, '../data/passengers.csv')
passenger_repo = PassengerRepository.new(passengers_csv_file_path, bus_repo)

pp bus_repo
pp passenger_repo
