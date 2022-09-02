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

#generate cares
care = Care.create!(
name: "Injection sous-cutanée",
description: "désinfection de la peau puis injecter calciparine")


swiss_address = ['Rue de la gare 2, le Brassus', 'Villard-sous-yens',' St-légier', 'yverdon-les-bains']
swiss_address_2 = ['le Pont, suisse', 'Orbe, suisse',' St-légier', 'yverdon-les-bains']

#generate patients
4.times do |i|
  p 'fake patient creation'
  profile_pic = URI.open(URL).read
  profile_pic_data = JSON.parse(profile_pic)
  patient_name_first = profile_pic_data["results"][0]["name"]["first"]
  patient_name_second = profile_pic_data["results"][0]["name"]["last"]
  patient_age = profile_pic_data["results"][0]["dob"]["date"]
  patient_gender = profile_pic_data["results"][0]["gender"]

  profile_pic_url = profile_pic_data["results"][0]["picture"]["medium"]

  patient = Patient.create(
    address: swiss_address[i],
    first_name: patient_name_first,
    last_name: patient_name_second,
    birth_date: patient_age,
    profile_pic: profile_pic_url,
    gender: patient_gender
  )

  patient_2 = Patient.create(
    address: swiss_address_2[i],
    first_name: patient_name_first,
    last_name: patient_name_second,
    birth_date: patient_age,
    profile_pic: profile_pic_url,
    gender: patient_gender
  )

  patient.save!
  consultation = Consultation.new(tour: tour, patient: patient)
  consultation.save!

  consultation_2 = Consultation.new(tour: tour_2, patient: patient_2)
  consultation_2.save!

  patient_care = PatientCare.new(patient: patient, care: care)
  patient_care.save!


  table = CSV.parse(filepath)

  anamnesis = Anamnesis.new(
    patient: patient,
    date:  Faker::Date.between(from: patient_age, to: Date.today),
    description: table[rand(0..50)][0].strip
  )
  anamnesis.save!
end
