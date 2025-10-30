class RoomsController
  def initialize(room_repository)
    @room_repository = room_repository
  end

  def add
    # Ask the user for the capacity
    # Tell room repository to create one room
    room = Room.new(capacity: 10)
    @room_repository.create(room)
  end
end
