class Consultation < ApplicationRecord
  belongs_to :tour
  belongs_to :patient
  has_many :validated_cares

  def validated_care_id(care)
    validated_cares.find_by(care: care).id
  end
end
