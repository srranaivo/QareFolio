# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
URL = "https://randomuser.me/api/"

require 'faker'
require 'open-uri'
require "csv"
filepath = File.read(Rails.root.join('db', 'anamneses.csv'))

#destroy existing seed
Anamnesis.destroy_all
Consultation.destroy_all
Tour.destroy_all
User.destroy_all
Patient.destroy_all

#generate a Nurse
nurse = User.new(first_name: 'Sophie', last_name: 'Ramahenina', email: "sophie@gmail.com", password: "123456", profile_pic: "https://avatars.githubusercontent.com/u/102239823?v=4")
nurse.save!

#generate a tour
tour = Tour.new(date: Date.today, user: nurse)
tour.save!

#generate patients
1..8.times do
  p 'fake patient creation'
  profile_pic = URI.open(URL).read
  profile_pic_data = JSON.parse(profile_pic)
  patient_name_first = profile_pic_data["results"][0]["name"]["first"]
  patient_name_second = profile_pic_data["results"][0]["name"]["last"]
  patient_age = profile_pic_data["results"][0]["dob"]["date"]
  patient_gender = profile_pic_data["results"][0]["gender"]

  profile_pic_url = profile_pic_data["results"][0]["picture"]["medium"]

  patient = Patient.create(
    address: Faker::Address.full_address,
    first_name: patient_name_first,
    last_name: patient_name_second,
    birth_date: patient_age,
    profile_pic: profile_pic_url,
    gender: patient_gender
  )

  patient.save!
  consultation = Consultation.new(tour: tour, patient: patient, position: 1)
  consultation.save!

  table = CSV.parse(filepath)

  anamnesis = Anamnesis.new(
    patient: patient,
    date:  Faker::Date.between(from: patient_age, to: Date.today),
    description: table[rand(0..50)][0].strip
  )
  anamnesis.save!
end
