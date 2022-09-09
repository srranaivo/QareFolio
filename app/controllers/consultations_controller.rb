require "erb"
include ERB::Util

class ConsultationsController < ApplicationController
  def show
    @consultation = Consultation.find(params[:id])

    @validated_cares = ValidatedCare.includes(:care).where(consultation: @consultation).order(:id)
    @remarks = @consultation.patient.remarks
    @remark = Remark.new

    address = @consultation.patient.address
    address_encoded = url_encode(address)
    base_url = 'https://www.google.com/maps/search/?api=1&query='
    @google_maps_link = "#{base_url}#{address_encoded}"
    p "link is : " + @google_maps_link
  end

  def update
    @consultation = Consultation.find(params[:id])
    if @consultation.update(consultation_params)
      if @consultation.tour.is_finished?
        redirect_to tour_finish_path(@consultation.tour)
      else
        redirect_to tour_path(@consultation.tour)
      end
    else
      redirect_to consultation_path(@consultation), notice: "Error"
    end
  end

  def destroy
    @consultation = Consultation.find(params[:id])
    @consultation.destroy
    @consultation.tour
    redirect_to edit_tour_path(@consultation.tour), notice: "consultation supprimée avec succès"
    # redirect_to tour_path(:id), status: :see_other
  end

  def create
    p 'create a consultation'
    p params
    consultation = Consultation.new(tour_id: params[:tour_id], patient_id: params[:id])
    consultation.save
    render json: {url: edit_tour_path(params[:tour_id])}
  end

  private

  def consultation_params
    params.require(:consultation).permit(:validated, :id)
  end
end
