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
    #consultations must be sorted by order in existing
    @consultations = @tour.consultations.order(:position)
  end

  def map
    consultations = Tour.find(params[:tour_id]).consultations
    patients_address = ''
    consultation_initial_order = []
    consultations.each do |consultation|
      #todo avoid last pipeline
      patients_address << " #{consultation.patient.address} |"
      consultation_initial_order << consultation.id
    end

    p "patients : #{consultation_initial_order}"
    p "adress : #{patients_address}"

    # creation of the request url
    base_url = "https://maps.googleapis.com/maps/api/directions/json?"
    origin = url_encode("Renens, route de lausanne 64")
    destination = url_encode("Renens, route de lausanne 64")
    waypoints = url_encode(patients_address)
    url_encoded = "#{base_url}origin=#{origin}&destination=#{destination}&waypoints=optimize%3Atrue%7C#{waypoints}&key=#{ENV['GOOGLE_MAP']}"
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

    p "google reorder : #{waypoint_order}"
  end
end
