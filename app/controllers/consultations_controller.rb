require "erb"
include ERB::Util

class ConsultationsController < ApplicationController
  def show
    @consultation = Consultation.find(params[:id])

    @validated_cares = ValidatedCare.includes(:care).where(consultation: @consultation).order(:id)
    @remarks = @consultation.remarks
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
      redirect_to tour_path(@consultation.tour)
    else
      redirect_to consultation_path(@consultation), notice: "Error"
    end
  end

  def destroy
    @consultation = Consultation.find(params[:id])
    @consultation.destroy
    @consultation.tour
    redirect_to edit_tour_path(@consultation.tour), notice: "consultattion supprimée avec succès"
    # redirect_to tour_path(:id), status: :see_other
  end

  private

  def consultation_params
    params.require(:consultation).permit(:validated)
  end
end
