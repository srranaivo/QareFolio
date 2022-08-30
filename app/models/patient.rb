class Patient < ApplicationRecord
  has_many :consultations
  has_many :patient_cares
  has_many :remarks
  has_many :anamneses, class_name: 'Anamnesis'
end
