class Room
  attr_accessor :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @capacity = attributes[:capacity] || 0
    @patients = attributes[:patients] || []
  end

  def full?
    @patients.length >= @capacity
  end

  def add_patient(patient) # expect patient instance
    raise StandardError, 'Room is full' if full?

    # assign room for patient
    patient.room = self
    @patients << patient
  end
end
