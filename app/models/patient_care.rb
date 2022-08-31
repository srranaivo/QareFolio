class PatientCare < ApplicationRecord
  belongs_to :patient
  belongs_to :care
end
