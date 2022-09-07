require "erb"
include ERB::Util
require 'open-uri'
require "net/http"

class ToursController < ApplicationController
  def index
    @tours = Tour.all
  end

  def show
    p '12: TOUR CONTROLLER SHOW START'
    @tour = Tour.find(params[:id])
    if @tour.map_data == {}
      p '15: TOUR CONTROLLER CALL GOOGLE API'
      data = optimize_tour(@tour.id)
      p '17 TOUR CONTROLLER RECIVE DATA FROM METHOD OPTIMIZE TOUR'
      # save json in db
      @tour.update(map_data: data)
      p '20: TOUR CONTROLLER DATA SAVED IN DB'
    end
    # consultations must be sorted by order in existing
    @consultations = @tour.consultations.order(:position)

    @travel_infos = []
    @tour.map_data['routes'][0]['legs'].each do |route|
      @travel_infos << { distance: route['distance']['text'], duration: route['duration']['text'] }
    end
    p @travel_infos

  end

  def optimize_tour(tour_id)
    p tour_id
    tour = Tour.find(tour_id)
    consultations = tour.consultations

    url_creation = create_url(consultations)
    url_encoded = url_creation[:url]
    consultation_initial_order = url_creation[:initial_order]
    p '34: TOUR CONTROLLER GET URL ENCODED'
    p url_encoded

    #call the api and parse in json format
    p '38: TOUR CONTROLLER CALLING API'
    #api_data = URI.open(url_encoded)

    url = URI(url_encoded)
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    request = Net::HTTP::Get.new(url)
    response = https.request(request)
    data_readed = response.read_body
    p '40: TOUR CONTROLLER OPEN DATA'
    #content = api_data.read
    p '42: TOUR CONTROLLER READING DATA'
    data_from_google = JSON.parse(data_readed)
    # p data_from_google
    p '44: TOUR CONTROLLER PARSING DATA'
    # order optimize by google
    p '46: TOUR CONTROLLER START ORGANIZING POSITIONS'
    waypoint_order = data_from_google["routes"][0]["waypoint_order"]
    # we need to change the position of the consultations based on the order of the waypoints
    consultations.each do |consultation|
      #find id index in consultation_initial_order
      initial_index = consultation_initial_order.find_index(consultation.id)
      final_index = waypoint_order.find_index(initial_index)
      consultation.update(position: final_index)
    end
    p '55: TOUR CONTROLLER ENDS ORGANIZING POSITIONS AND RETURN DATA'
      return data_from_google
  end


  def map
    @tour_id = params[:tour_id]
    @tour = Tour.find(@tour_id)

    if @tour.map_data == "{}"
      data = optimize_tour(@tour_id)
      # save json in db
      @tour.update(map_data: data)
    end
    # we respond differently if the front request or the back
    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.json { render json: @tour.map_data }
    end

    # url_creation = create_url(consultations)
    # url_encoded = url_creation[:url]
    # consultation_initial_order = url_creation[:initial_order]
    # p url_encoded

    # #call the api and parse in json format
    # content = URI.open(url_encoded).read
    # data_from_google = JSON.parse(content)
    # # order optimize by google
    # waypoint_order = data_from_google["routes"][0]["waypoint_order"]
    # # we need to change the position of the consultations based on the order of the waypoints
    # consultations.each do |consultation|
    #   #find id index in consultation_initial_order
    #   initial_index = consultation_initial_order.find_index(consultation.id)
    #   final_index = waypoint_order.find_index(initial_index)
    #   consultation.update(position: final_index)
    # end
  end

  def finish
    @tour = Tour.find(params[:tour_id])
    @nb_consultation = @tour.consultations.count
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
    origin = url_encode(current_user.address)
    destination = url_encode(current_user.arrival_address)
    waypoints = url_encode(patients_address)
    url_encoded = "#{base_url}origin=#{origin}&destination=#{destination}&waypoints=optimize%3Atrue%7C#{waypoints}&mode=driving&key=#{ENV['GOOGLE_MAP']}"
    return {url: url_encoded, initial_order: consultation_initial_order}
  end
end
