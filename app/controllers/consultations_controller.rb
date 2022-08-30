class ConsultationsController < ApplicationController
  def show
    @consultation = Consultation.find(params[:id])
  end
end
