require_relative '../models/room'
require 'csv'

class RoomRepository
  def initialize(csv_file_path)
    @rooms = []
    @csv_file_path = csv_file_path
    load_csv
  end

  def create(room) # The instance came in doesn't know what the id should be
    room.id = @next_id
    @rooms << room
    @next_id += 1
  end

  private

  def load_csv
    # open the csv file
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      # go each row
      row[:id] = row[:id].to_i
      row[:capacity] = row[:capacity].to_i
      @rooms << Room.new(row)
      # make and instance of room for each row
      # put room into the @rooms array
    end

    @next_id = @rooms.empty? ? 1 : @rooms.last.id + 1
  end
end

rr = RoomRepository.new('data/rooms.csv')

pp rr

room = Room.new(capacity: 4)

rr.create(room)

puts 'after adding one room'
pp rr
