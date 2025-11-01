class Passenger
  attr_accessor :bus, :id
  attr_reader :name, :age

  def initialize(attributes = {}) # hash
    @id = attributes[:id]
    @name = attributes[:name]
    @age = attributes[:age]
  end
end
