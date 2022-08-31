require "erb"
include ERB::Util
require "uri"
require "net/http"

class ToursController < ApplicationController
  def index
    @tours = Tour.all
  end

  def show
    @tour = Tour.find(params[:id])
    @consultations = @tour.consultations
  end

  def map
    base_url = "https://maps.googleapis.com/maps/api/directions/json?"
    origin = url_encode("Renens, route de lausanne 64")
    destination = url_encode("Montreux")
    waypoints = url_encode("Yverdon-les-bains,VD")
    api_key = 'AIzaSyCbwW6MnwhGlDzRcXt60O9uzirzV_1O3E4'

    url_encoded = "#{base_url}origin=#{origin}&destination=#{destination}&waypoints=#{waypoints}&key=#{api_key}"
    p url_encoded

    # url = URI(url_encoded)

    # https = Net::HTTP.new(url.host, url.port)
    # https.use_ssl = true

    # request = Net::HTTP::Get.new(url)

    # response = https.request(request)
    #puts response.read_body
  end
end
