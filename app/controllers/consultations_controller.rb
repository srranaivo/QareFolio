class ConsultationsController < ApplicationController
  def show
    @consultation = Consultation.find(params[:id])
  end

  def checked?(consultation)
    @consultation.patient.patient_cares.find(params[:care_id])
  end
end
