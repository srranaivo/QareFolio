class PatientCare < ApplicationRecord
  belongs_to :patient
  belongs_to :care

  def checked?
    ValidatedCare.find_by(care: care).present?
  end
end
