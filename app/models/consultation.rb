class Consultation < ApplicationRecord
  belongs_to :tour
  belongs_to :patient
  has_many :validated_cares
  has_many :cares, through: :validated_cares
  has_many :remarks
  after_create :create_validated_cares

  before_destroy :destroy_dependencies

  def validated_care_id(care)
    if validated_cares.find_by(care: care)
      validated_cares.find_by(care: care).id
    end
  end

  def create
    @consultation = Consultation.new(consultation_params)
    @consultation.save
  end

  private

  def consultation_params
    params.require(:consultation).permit(:tour, :care)
  end

  def create_validated_cares
    patient.cares.each do |care|
      ValidatedCare.create!(care: care, consultation: self)
    end
  end

  def destroy_dependencies
    validated_cares.destroy_all
    remarks.destroy_all
  end
end
