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
PatientCare.destroy_all
Care.destroy_all
Patient.destroy_all


#generate a Nurse
nurse = User.new(first_name: 'Sophie', last_name: 'Ramahenina', email: "sophie@gmail.com", password: "123456", profile_pic: "https://avatars.githubusercontent.com/u/102239823?v=4")
nurse.save!

#generate a tour
tour = Tour.new(date: Date.today, user: nurse)
tour.save!

tour_2 = Tour.new(date: 1.day.from_now, user: nurse)
tour_2.save!

tour_3 = Tour.new(date: 1.day.from_now, user: nurse)
tour_3.save!

#generate cares
  care = Care.create!(
    name: "Injection sous-cutanée de calciparine"
  )
  care_2 = Care.create!(
    name: "Surveillance de la tension artérielle"
  )
  care_3 = Care.create!(
    name: "pansement simple mollet gauche"
  )

  care_4 = Care.create!(
    name: "pansement cathéter de dialyse"
  )

  care_5 = Care.create!(
    name: "injection d'insuline"
  )

#generate patients
# 3.times do
#   p 'fake patient creation'
#   profile_pic = URI.open(URL).read
#   profile_pic_data = JSON.parse(profile_pic)
#   patient_name_first = profile_pic_data["results"][0]["name"]["first"]
#   patient_name_second = profile_pic_data["results"][0]["name"]["last"]
#   patient_age = profile_pic_data["results"][0]["dob"]["date"]
#   patient_gender = profile_pic_data["results"][0]["gender"]

#   profile_pic_url = profile_pic_data["results"][0]["picture"]["medium"]

  # patient = Patient.create(
  #   address: Faker::Address.full_address,
  #   first_name: patient_name_first,
  #   last_name: patient_name_second,
  #   birth_date: patient_age,
  #   profile_pic: profile_pic_url,
  #   gender: patient_gender
  # )

  # Créer des patients
  # Créer des consultations
  # Créer des Anamnèses

  patient = Patient.create!(

    address: "chemin du Vallon 10 Bussigny ",
    first_name: "Jean",
    last_name: "Testaz",
    birth_date: "27.03.1952",
    gender: "male"
  )

  patient_2 = Patient.create!(
    address: "Av. de Montchoisi 41, 1006 Lausanne",
    first_name: "Gisèle",
    last_name: " Zermatten ",
    birth_date: "12.06.1940",
    gender: "female"
  )

  patient_3 = Patient.create!(
    address: "Chem. des Orchez 20, 1066 Epalinges",
    first_name: "Alphred",
    last_name: "Bally",
    birth_date: "02.07.1957",
    gender: "male"

  )

  patient_4 = Patient.create!(
    address: "Av. de Montoie 19, 1007 Lausanne",
    first_name: "Géraldine",
    last_name: "Da Silva",
    birth_date: "11.12.1996",
    gender: "female"

  )




  Consultation.create!(tour: tour, patient: patient)
  Consultation.create!(tour: tour, patient: patient_2)

  Consultation.create!(tour: tour_2, patient: patient)
  Consultation.create!(tour: tour_2, patient: patient_2)

  Consultation.create!(tour: tour_3, patient: patient)
  Consultation.create!(tour: tour_3, patient: patient_3)


  PatientCare.create!(patient: patient, care: care)
  PatientCare.create!(patient: patient_2, care: care_2)

  PatientCare.create!(patient: patient_3, care: care_3)
  PatientCare.create!(patient: patient_4, care: care_4)



  # patient_care = PatientCare.new(patient: patient, care: care)
  # patient_care.save!


  table = CSV.parse(filepath)

  # anamnesis = Anamnesis.new(
  #   patient: patient,
  #   date:  Faker::Date.between(from: "1930-10-03", to: Date.today),
  #   description: table[rand(0..50)][0].strip
  # )
  # anamnesis.save!

Anamnesis.create!(
  patient: patient,
  date:  Faker::Date.between(from: "27.03.1952", to: Date.today),
  description: table[rand(0..50)][0].strip
)

Anamnesis.create!(
  patient: patient_2,
  date:  Faker::Date.between(from: "12.06.1940", to: Date.today),
  description: table[rand(0..50)][0].strip
)


Anamnesis.create!(
  patient: patient_3,
  date:  Faker::Date.between(from: "02.07.1957", to: Date.today),
  description: table[rand(0..50)][0].strip
)


Anamnesis.create!(
  patient: patient_4,
  date:  Faker::Date.between(from: "11.12.1996", to: Date.today),
  description: table[rand(0..50)][0].strip
)



# end
