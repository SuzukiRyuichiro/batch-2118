require_relative 'models/patient'
require_relative 'models/room'

room1 = Room.new
scooter = Patient.new(name: 'Scooter')

room1.add_patient(scooter)

p scooter
