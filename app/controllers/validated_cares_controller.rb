class ValidatedCaresController < ApplicationController
  def create
    puts "creation of validated cares"
    ValidatedCare.create!(care_id: params[:care_id], consultation_id: params[:consultation_id])
  end

  def update
    @validated_care = ValidatedCare.find(params[:id])
    p @validated_care
    unless @validated_care.nil?
      if @validated_care.done
        @validated_care.update(done: false)
      else
        @validated_care.update(done: true)
      end
      redirect_to consultation_path(@validated_care.consultation)
    end
  end
end
