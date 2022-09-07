class Consultation < ApplicationRecord
  belongs_to :tour
  belongs_to :patient
  has_many :validated_cares
  has_many :cares, through: :validated_cares
  has_many :remarks
  after_create :create_validated_cares

  def validated_care_id(care)
    if validated_cares.find_by(care: care)
      validated_cares.find_by(care: care).id
    end
  end

  private

  def create_validated_cares
    patient.cares.each do |care|
      ValidatedCare.create!(care: care, consultation: self)
    end
  end
end
