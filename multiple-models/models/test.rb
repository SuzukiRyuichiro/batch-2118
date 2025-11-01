require_relative 'bus'
require_relative 'passenger'

edward = Passenger.new(name: 'Edward', age: 20)
mahmud = Passenger.new(name: 'Mahmud', age: 18)
chantal = Passenger.new(name: 'Chantal', age: 16)

Bus.new(capacity: 10, route_number: 218, accessible: true)
le_wagon = Bus.new(capacity: 2, route_number: 420)

le_wagon.pickup(mahmud)
le_wagon.pickup(chantal)

meguro_bus.pickup(edward)

pp le_wagon
