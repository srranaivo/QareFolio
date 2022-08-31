import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
var directionsRenderer = new google.maps.DirectionsRenderer();
var directionsService = new google.maps.DirectionsService();

export default class extends Controller {
  static targets = ["google"];

  connect() {
    console.log("Connecting to data-controller");
    this.#initMap();
  }

  #initMap() {
    console.log("initMap");
    console.log(this.googleTarget)

    var center = new google.maps.LatLng(46.850033, 7.6500523);
    var mapOptions = {
      zoom:10,
      center: center
    }

    var map = new google.maps.Map(this.googleTarget, mapOptions);
    directionsRenderer.setMap(map);
    this.#calcRoute();
  }

  #calcRoute() {
    var request = {
      origin: 'renens, vd',
      destination: 'le brassus',
      travelMode: 'DRIVING'
    };
    directionsService.route(request, function(result, status) {
      if (status == 'OK') {
        directionsRenderer.setDirections(result);
      }
    });
  }
}
