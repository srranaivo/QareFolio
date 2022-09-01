class ValidatedCaresController < ApplicationController
  def create
    puts "creation of validated cares"
    ValidatedCare.create!(care_id: params[:care_id], consultation_id: params[:consultation_id])
  end
end
