patrick = Doctor.create(name: 'Patrick', age: 26, gender: 'male', specialty: 'Psychology')
mahmud = Doctor.create(name: 'Mahmud', age: 27, gender: 'male', specialty: 'Surgery')

Intern.create(name: 'Scooter', age: 30, gender: 'male', doctor: patrick)
Intern.create(name: 'Hisham', age: 30, gender: 'male', doctor: patrick)
Intern.create(name: 'Chantal', age: 30, gender: 'female', doctor: mahmud)

troy = Patient.create(name: 'Troy', age: 30)
adrian = Patient.create(name: 'Adrian', age: 30)

Appointment.create(patient: troy, doctor: mahmud, date: Date.new)
Appointment.create(patient: adrian, doctor: patrick, date: Date.new)
