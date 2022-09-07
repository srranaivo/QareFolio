import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="nurse-address"
export default class extends Controller {
  static targets = ['arrival']

  connect() {
    console.log(this.arrivalTarget)
  }

  show_arrival(e) {
    this.arrivalTarget.classList.toggle('d-none');

  }
}
