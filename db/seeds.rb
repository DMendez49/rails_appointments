
roles = ['docter', 'nurse', 'Patient']
10.times do
  hospital = Hospital.create(
    name: Faker::Company.hospital_name
  )
 
  10.times do 
    patient = Patient.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name
    )

    Appointment.create(
      role: roles.sample,
      hospital_id: hospital.id,
      patient_id: patient.id
    )
  end
end

puts "Data Seeded."