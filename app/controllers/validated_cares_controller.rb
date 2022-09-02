class ValidatedCaresController < ApplicationController
  def create
    puts "creation of validated cares"
    ValidatedCare.create!(care_id: params[:care_id], consultation_id: params[:consultation_id])
  end

  def destroy_by_care_id(care_id)
    puts "deletion of validated cares"
    @validated_care = ValidatedCare.find_by(care: care_id)
    @validated_care.destroy unless @validated_care.nil?
  end
end
