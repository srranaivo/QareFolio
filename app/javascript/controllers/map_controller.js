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
    /* console.log("initMap");
    console.log(this.googleTarget)
    */
    var center = new google.maps.LatLng(46.5196535, 6.6322734);
    var mapOptions = {
      zoom: 8,
      center: center,
      suppressMarkers: true,
    }

    var map = new google.maps.Map(this.googleTarget, mapOptions);
    // console.log('setmap')
    directionsRenderer.setMap(map);
    setTimeout(() => {
      // console.log('call api rails')
      this.#getJson()
    }, 1000);
  }

  #getJson() {
    const tour_id = this.googleTarget.dataset.tourIdValue;

    /* call the server to get the travel data in JSON */
    fetch(`/tours/${tour_id}/map`, {
      method: "GET",
      headers: {
        "Accept": "application/json"
      }
    })
      .then(response => response.json())
      .then((response) => {
        /* we need to adapt the json from direction api to use in in javascript map api */
        /* see : https://stackoverflow.com/questions/47168200/google-maps-display-route-from-json */
          response["request"] = {
            "travelMode": "DRIVING"
          }
          if (response.status === 'OK') {
            var bounds = new google.maps.LatLngBounds(response.routes[0].bounds.southwest, response.routes[0].bounds.northeast);
            response.routes[0].bounds = bounds;
            response.routes[0].overview_path = google.maps.geometry.encoding.decodePath(response.routes[0].overview_polyline.points);
            response.routes[0].legs = response.routes[0].legs.map(function (leg) {
              leg.start_location = new google.maps.LatLng(leg.start_location.lat, leg.start_location.lng);
              leg.end_location = new google.maps.LatLng(leg.end_location.lat, leg.end_location.lng);
              leg.steps = leg.steps.map(function (step) {
                step.path = google.maps.geometry.encoding.decodePath(step.polyline.points);
                step.start_location = new google.maps.LatLng(step.start_location.lat, step.start_location.lng);
                step.end_location = new google.maps.LatLng(step.end_location.lat, step.end_location.lng);
                return step;
              });
              return leg;
            });
            // console.log(response)
            // console.log('setDirections')
            directionsRenderer.setDirections(response);
          }
        }
      )
  }
}
