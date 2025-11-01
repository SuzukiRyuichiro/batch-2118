class Bus
  attr_accessor :id
  attr_reader :capacity, :route_number, :accessible

  def initialize(attributes = {}) # hash
    @id = attributes[:id]
    @capacity = attributes[:capacity]
    @route_number = attributes[:route_number]
    @accessible = attributes[:accessible] || false
    @passengers = attributes[:passengers] || [] # array of Passenger instances
  end

  def pickup(passenger) # expect a Passenger instance
    raise StandardError, 'Bus is full' if full?

    # assign bus attribute to the passenger
    passenger.bus = self

    @passengers << passenger
  end

  def full?
    @passengers.size >= @capacity
  end
end
