import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="checklist"
export default class extends Controller {
  static targets = ['checkbox']
  static values = {consultation: Number}

  connect() {
    console.log("checkbox"), this.checkboxTarget
  }

  checklist(e) {
    console.log(this.element)
    this.element.submit();
  }
}
