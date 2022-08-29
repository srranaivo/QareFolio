class PatientCare < ApplicationRecord
  belongs_to :patient
  belongs_to :cares
end
