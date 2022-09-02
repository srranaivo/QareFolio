class ConsultationsController < ApplicationController
  def show
    @consultation = Consultation.find(params[:id])

    address = @consultation.patient.address
    address_encoded = url_encode(address)
    base_url = 'https://www.google.com/maps/search/?api=1&query='
    @google_maps_link = "#{base_url}#{address_encoded}"
    p "link is : " + @google_maps_link
  end
end
