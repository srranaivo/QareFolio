require "erb"
include ERB::Util
require "uri"
require 'open-uri'

class ToursController < ApplicationController
  def index
    @tours = Tour.all
  end

  def show
    @tour = Tour.find(params[:id])
    # consultations must be sorted by order in existing
    @consultations = @tour.consultations.order(:position)
  end

  def map
    @tour_id = params[:tour_id]
    consultations = Tour.find(params[:tour_id]).consultations

    url_creation = create_url(consultations)
    url_encoded = url_creation[:url]
    consultation_initial_order = url_creation[:initial_order]
    p url_encoded

    #call the api and parse in json format
    content = URI.open(url_encoded).read
    data_from_google = JSON.parse(content)
    # order optimize by google
    waypoint_order = data_from_google["routes"][0]["waypoint_order"]
    # we need to change the position of the consultations based on the order of the waypoints
    consultations.each do |consultation|
      #find id index in consultation_initial_order
      initial_index = consultation_initial_order.find_index(consultation.id)
      final_index = waypoint_order.find_index(initial_index)
      consultation.update(position: final_index)
    end
    # we respond differently if the front request or the back
    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.json { render json: content }
    end
  end

  private

  def create_url(consul)
    consultations = consul
    patients_address = ''
    consultation_initial_order = []
    consultations.each do |consultation|
      #todo avoid last pipeline
      patients_address << " #{consultation.patient.address} |"
      consultation_initial_order << consultation.id
    end

    # creation of the request url
    base_url = "https://maps.googleapis.com/maps/api/directions/json?"
    origin = url_encode("Renens, route de lausanne 64")
    destination = url_encode("Renens, route de lausanne 64")
    waypoints = url_encode(patients_address)
    url_encoded = "#{base_url}origin=#{origin}&destination=#{destination}&waypoints=optimize%3Atrue%7C#{waypoints}&mode=driving&key=#{ENV['GOOGLE_MAP']}"
    return {url: url_encoded, initial_order: consultation_initial_order}
  end
end
