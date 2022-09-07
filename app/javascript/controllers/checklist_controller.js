import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="checklist"
export default class extends Controller {
  static targets = ['checkbox']
  static values = {consultation: Number}

  connect() {
    console.log("checkbox")
  }

  checklist(e) {
    this.element.classList.toggle("validated-checklist")
    console.log(this.checkboxTarget)
    this.element.submit();
  }
}
