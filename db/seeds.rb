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
tour_1 = Tour.new(date: Date.today, user: nurse)
tour_1.save!

tour_2 = Tour.new(date: 1.day.from_now, user: nurse)
tour_2.save!

tour_3 = Tour.new(date: 2.day.from_now, user: nurse)
tour_3.save!

tour_4 = Tour.new(date: -1.day.from_now, user: nurse)
tour_4.save!

#generate cares

care_1 = Care.create!(
name: "Injection d'insuline lente"
)

care_2 = Care.create!(
name: "Surveillance glycémique"
)

care_3 = Care.create!(
name: "Changement du capteur glycémique"
)

care_4 = Care.create!(
name: "Donner les médicaments"
)

care_5 = Care.create!(
name: "Prise des paramètres vitaux"
)

care_6 = Care.create!(
name: "Surveillance de la saturation"
)

care_7 = Care.create!(
name: "Pansement escarre au talon droit"
)

care_8 = Care.create!(
name: "Injection de neuroleptique retard"
)

care_9 = Care.create!(
name: "Surveillance fistule artério-veineuse"
)

care_10 = Care.create!(
name: "Injection sous-cutanée d'anticoagulant"
)

care_11 = Care.create!(
name: "Changement de l'aiguille Huber"
)

care_12 = Care.create!(
name: "Administration de chimiothérapie"
)

care_13 = Care.create!(
name: "Pose des bas de contention"
)

care_14 = Care.create!(
name: "Stimuler l'hydratation"
)

care_15 = Care.create!(
name: "Pose des bandes de contention"
)

care_16 = Care.create!(
name: "Préparation du semainier"
)

care_17 = Care.create!(
name: "Pansement au niveau des carcinomes cutanés des avant-bras et de la cuisse gauche"
)

care_18 = Care.create!(
name: "Surveillance de la tension artérielle"
)

care_19 = Care.create!(
name: "Surveillance de l'état cutané"
)
care_20 = Care.create!(
name: "Adminstration de collyre au niveau des deux yeux"
)

care_21 = Care.create!(
name: "Changement de sonde vésicale"
)

care_22 = Care.create!(
name: "Education thérapeutique concernant la sonde vésicale"
)

care_23 = Care.create!(
name: "Pansement de picc line"
)

care_24 = Care.create!(
name: "Administration intra-veineuse d'antibiotique"
)

care_25 = Care.create!(
name: "Organiser le prochain RDV médical avec l'hépatologue"
)

care_26 = Care.create!(
name: "Entretien thérapeutique infirmier"
)
care_27 = Care.create!(
name: "Surveillance des signes infectieux"
)


#generate patients
# 3.times do
# p 'fake patient creation'
# profile_pic = URI.open(URL).read
# profile_pic_data = JSON.parse(profile_pic)
# patient_name_first = profile_pic_data["results"][0]["name"]["first"]
# patient_name_second = profile_pic_data["results"][0]["name"]["last"]
# patient_age = profile_pic_data["results"][0]["dob"]["date"]
# patient_gender = profile_pic_data["results"][0]["gender"]

# profile_pic_url = profile_pic_data["results"][0]["picture"]["medium"]

# patient = Patient.create(
# address: Faker::Address.full_address,
# first_name: patient_name_first,
# last_name: patient_name_second,
# birth_date: patient_age,
# profile_pic: profile_pic_url,
# gender: patient_gender
# )

# Créer des patients
# Créer des consultations
# Créer des Anamnèses

patient_1 = Patient.create!(
address: "Chem. des Orchez 20, 1066 Epalinges",
first_name: "Aline",
last_name: "Bally",
birth_date: "02.07.1957",
gender: "female",
picture_url: "/assets/patient_1.jpg"
)

patient_2 = Patient.create!(
address: "Av. de Montchoisi 41, 1006 Lausanne",
first_name: "Gisèle",
last_name: " Zermatten ",
birth_date: "12.06.1991",
gender: "female",
picture_url: "/assets/patient_2.jpg"
)

patient_3 = Patient.create!(
address: "chemin du Vallon 10 Bussigny ",
first_name: "Jeanne",
last_name: "Testaz",
birth_date: "27.03.1952",
gender: "female",
picture_url: "/assets/patient_3.jpg"
)

patient_4 = Patient.create!(
address: "Av. de Montoie 19, 1007 Lausanne",
first_name: "Géraldine",
last_name: "Da Silva",
birth_date: "11.12.1968",
gender: "female",
picture_url: "/assets/patient_4.jpg"
)

patient_5 = Patient.create!(
address: "Rue de morges 14 Crissier",
first_name: "Thomas",
last_name: "Breuveau",
birth_date: "21.02.1969",
gender: "male",
picture_url: "/assets/patient_5.jpg"
)

patient_6 = Patient.create!(
address: "Avenue de France 98, 1004 Lausanne",
first_name: "Aurélie",
last_name: "Claivaz",
birth_date: "25.07.1986",
gender: "female",
picture_url: "/assets/patient_6.jpg"
)

patient_7 = Patient.create!(
address: "Chemin de l'Union 4, 1008 Prilly",
first_name: "Yvette",
last_name: "Flon",
birth_date: "18.04.1950",
gender: "female",
picture_url: "/assets/patient_7.jpg"
)

patient_8 = Patient.create!(
address: "Chemin des Planches 6, 1008 Prilly",
first_name: "Aude",
last_name: "Berset",
birth_date: "16.12.1982",
gender: "female",
picture_url: "/assets/patient_8.jpg"
)

patient_9 = Patient.create!(
address: "Chemin du Chêne 9, 1052 Le Mont-sur-Lausanne",
first_name: "Jacques",
last_name: "Crettenand",
birth_date: "20.08.1949",
gender: "male",
picture_url: "/assets/patient_9.jpg"
)

patient_10 = Patient.create!(
address: "Avenue des Alpes, 1009 Pully",
first_name: "Elisabeth",
last_name: "Morard",
birth_date: "10.01.1926",
gender: "female",
picture_url: "/assets/patient_10.jpg"
)

patient_11 = Patient.create!(
address: "Avenue des Cerisiers 7, 1009 Pully",
first_name: "Gérard",
last_name: "Frémont",
birth_date: "27.03.1947",
gender: "male",
picture_url: "/assets/patient_11.jpg"
)

patient_12 = Patient.create!(
address: "Avenue d'Ouchy 31, 1006 Lausanne",
first_name: "Yann",
last_name: "Studer",
birth_date: "06.05.1966",
gender: "male",
picture_url: "/assets/patient_12.jpg"
)

patient_13 = Patient.create!(
address: "Rue du Midi, 1003 Lausanne",
first_name: "Sylvie",
last_name: "Monnet",
birth_date: "04.10.1962",
gender: "female",
picture_url: "/assets/patient_13.jpg"
)

patient_14 = Patient.create!(
address: "Avenue de Tivoli 32, 1007 Lausanne",
first_name: "Gilles",
last_name: "Boccardo",
birth_date: "22.09.1943",
gender: "male",
picture_url: "/assets/patient_14.jpg"
)

patient_15 = Patient.create!(
address: "Chemin de Montelly 39, 1007 Lausanne",
first_name: "Laurent",
last_name: "Ruchet",
birth_date: "29.11.1955",
gender: "male",
picture_url: "/assets/patient_15.jpg"
)

patient_16 = Patient.create!(
address: "Rue du Lac 42, 1020 Renens",
first_name: "Raymond",
last_name: "Rochat",
birth_date: "24.09.1943",
gender: "male",
picture_url: "/assets/patient_16.jpg"
)

patient_17 = Patient.create!(
address: "Rue du Lac 42, 1020 Renens",
first_name: "Nadine",
last_name: "Gomes",
birth_date: "11.12.1996",
gender: "female",
picture_url: "/assets/patient_17.jpg"
)

Consultation.create!(tour: tour_1, patient: patient_1)
Consultation.create!(tour: tour_1, patient: patient_2)
Consultation.create!(tour: tour_1, patient: patient_3)
Consultation.create!(tour: tour_1, patient: patient_4)
Consultation.create!(tour: tour_1, patient: patient_5)
Consultation.create!(tour: tour_1, patient: patient_6)

Consultation.create!(tour: tour_2, patient: patient_1)
Consultation.create!(tour: tour_2, patient: patient_2)
Consultation.create!(tour: tour_2, patient: patient_3)
Consultation.create!(tour: tour_2, patient: patient_5)
Consultation.create!(tour: tour_2, patient: patient_7)
Consultation.create!(tour: tour_2, patient: patient_8)

Consultation.create!(tour: tour_3, patient: patient_1)
Consultation.create!(tour: tour_3, patient: patient_2)
Consultation.create!(tour: tour_3, patient: patient_8)
Consultation.create!(tour: tour_3, patient: patient_9)
Consultation.create!(tour: tour_3, patient: patient_10)
Consultation.create!(tour: tour_3, patient: patient_11)

Consultation.create!(tour: tour_4, patient: patient_12)
Consultation.create!(tour: tour_4, patient: patient_13)
Consultation.create!(tour: tour_4, patient: patient_14)
Consultation.create!(tour: tour_4, patient: patient_15)
Consultation.create!(tour: tour_4, patient: patient_16)
Consultation.create!(tour: tour_4, patient: patient_17)

PatientCare.create!(patient: patient_1, care: care_1)
PatientCare.create!(patient: patient_1, care: care_2)
PatientCare.create!(patient: patient_1, care: care_3)

PatientCare.create!(patient: patient_2, care: care_4)
PatientCare.create!(patient: patient_2, care: care_5)
PatientCare.create!(patient: patient_2, care: care_26)

PatientCare.create!(patient: patient_3, care: care_4)
PatientCare.create!(patient: patient_3, care: care_5)
PatientCare.create!(patient: patient_3, care: care_13)

PatientCare.create!(patient: patient_4, care: care_6)
PatientCare.create!(patient: patient_4, care: care_7)
PatientCare.create!(patient: patient_4, care: care_13)

PatientCare.create!(patient: patient_5, care: care_4)
PatientCare.create!(patient: patient_5, care: care_16)
PatientCare.create!(patient: patient_5, care: care_25)

PatientCare.create!(patient: patient_6, care: care_4)
PatientCare.create!(patient: patient_6, care: care_8)
PatientCare.create!(patient: patient_6, care: care_26)

PatientCare.create!(patient: patient_7, care: care_9)
PatientCare.create!(patient: patient_7, care: care_1)
PatientCare.create!(patient: patient_7, care: care_2)

PatientCare.create!(patient: patient_8, care: care_10)
PatientCare.create!(patient: patient_8, care: care_5)
PatientCare.create!(patient: patient_8, care: care_26)

PatientCare.create!(patient: patient_9, care: care_5)
PatientCare.create!(patient: patient_9, care: care_10)
PatientCare.create!(patient: patient_9, care: care_26)

PatientCare.create!(patient: patient_10, care: care_14)
PatientCare.create!(patient: patient_10, care: care_15)
PatientCare.create!(patient: patient_10, care: care_16)

PatientCare.create!(patient: patient_11, care: care_5)
PatientCare.create!(patient: patient_11, care: care_13)
PatientCare.create!(patient: patient_11, care: care_26)

PatientCare.create!(patient: patient_12, care: care_17)
PatientCare.create!(patient: patient_12, care: care_16)
PatientCare.create!(patient: patient_12, care: care_5)

PatientCare.create!(patient: patient_13, care: care_23)
PatientCare.create!(patient: patient_13, care: care_24)
PatientCare.create!(patient: patient_13, care: care_5)

PatientCare.create!(patient: patient_14, care: care_16)
PatientCare.create!(patient: patient_14, care: care_19)
PatientCare.create!(patient: patient_14, care: care_20)

PatientCare.create!(patient: patient_15, care: care_21)
PatientCare.create!(patient: patient_15, care: care_22)
PatientCare.create!(patient: patient_15, care: care_27)

PatientCare.create!(patient: patient_16, care: care_11)
PatientCare.create!(patient: patient_16, care: care_12)
PatientCare.create!(patient: patient_16, care: care_16)

PatientCare.create!(patient: patient_17, care: care_18)
PatientCare.create!(patient: patient_17, care: care_16)
PatientCare.create!(patient: patient_17, care: care_26)

# patient_care = PatientCare.new(patient: patient, care: care)
# patient_care.save!

table = CSV.parse(filepath)

# anamnesis = Anamnesis.new(
# patient: patient,
# date: Faker::Date.between(from: "1930-10-03", to: Date.today),
# description: table[rand(0..50)][0].strip
# )
# anamnesis.save!

Anamnesis.create!(
patient: patient_1,
date: "1967-03-10",
description: "Diabète"
)

Anamnesis.create!(
patient: patient_1,
date: "2001-03-10",
description: "Calculs rénaux"
)
Anamnesis.create!(
patient: patient_2,
date: "2015-03-10",
description: "Troubles bipolaires"
)

Anamnesis.create!(
patient: patient_2,
date: "2018-03-10",
description: "Hypotension et Bradycardie"
)

Anamnesis.create!(
patient: patient_3,
date: "2020-03-10",
description: "Troubles dépressifs"
)

Anamnesis.create!(
patient: patient_4,
date: "1968-03-10",
description: "Retard mental sévère"
)

Anamnesis.create!(
patient: patient_4,
date: "2022-03-10",
description: "COVID avec persistance de troubles respiratoires"
)

Anamnesis.create!(
patient: patient_4,
date: "1998-03-10",
description: "Crise d'épilepsie"
)

Anamnesis.create!(
patient: patient_5,
date: "2017-03-10",
description: "Alcoolisme chronique"
)

Anamnesis.create!(
patient: patient_5,
date: "2014-03-10",
description: "Trouble de la personnalité"
)

Anamnesis.create!(
patient: patient_6,
date: "2011-03-10",
description: "Schizophrénie"
)

Anamnesis.create!(
patient: patient_7,
date: "2000-03-10",
description: "Diabète"
)

Anamnesis.create!(
patient: patient_7,
date: "2021-03-10",
description: "Insuffisance rénale terminale, dialyse sur FAV"
)

Anamnesis.create!(
patient: patient_8,
date: "2022-03-10",
description: "Thrombose veineuse profonde post-partum"
)

Anamnesis.create!(
patient: patient_9,
date: "2019-03-10",
description: "Cancer digestif"
)
Anamnesis.create!(
patient: patient_9,
date: "2020-03-10",
description: "Pose d'un PAC"
)

Anamnesis.create!(
patient: patient_10,
date: "2017-03-10",
description: "Hypotension orthostatique"
)

Anamnesis.create!(
patient: patient_10,
date: "2019-03-10",
description: "Troubles cognitifs"
)

Anamnesis.create!(
patient: patient_11,
date: "2016-03-10",
description: "Parkinson"
)
Anamnesis.create!(
patient: patient_11,
date: "2019-03-10",
description: "Trouble dépressif"
)

Anamnesis.create!(
patient: patient_12,
date: "2012-03-10",
description: "Hépatite B"
)

Anamnesis.create!(
patient: patient_12,
date: "2020-03-10",
description: "Carcinomes cutanés"
)

Anamnesis.create!(
patient: patient_13,
date: "2016-03-10",
description: "BPCO"
)

Anamnesis.create!(
patient: patient_13,
date: "2022-03-10",
description: "Pneumonie sévère"
)

Anamnesis.create!(
patient: patient_14,
date: "2021-03-10",
description: "AVC"
)

Anamnesis.create!(
patient: patient_14,
date: "2012-03-10",
description: "Cataracte"
)

Anamnesis.create!(
patient: patient_14,
date: "2021-03-10",
description: "Trouble de la marche et de l'équilibre"
)

Anamnesis.create!(
patient: patient_15,
date: "2021-03-10",
description: "Cancer de la vessie"
)

Anamnesis.create!(
patient: patient_16,
date: "2022-03-10",
description: "Leucémie"
)

Anamnesis.create!(
patient: patient_17,
date: "1996-03-10",
description: "Retard mental"
)
Anamnesis.create!(
patient: patient_17,
date: "1996-03-10",
description: "Pathologie cardiaque congénitale"
)
# end
