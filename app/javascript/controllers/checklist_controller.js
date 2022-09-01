import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="checklist"
export default class extends Controller {
  static targets = ['validated_cares']
  static values = {consultation: Number}

  connect() {
    console.log("checked:", this.element);
    console.log("care value:", this);
    console.log("My checklist", this.validated_caresTarget.dataset.checklistIdValue)
    }

  checklist(e) {
    this.validated_caresTarget.innerHTML = "Ce soin est effectué"

    fetch(`/consultations/${this.consultationValue}/validated_cares`, {
      method: "POST",
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "X-CSRF-Token": this.#getMetaValue()
      },
      body: JSON.stringify({"care_id": e.target.value})
    })

  }
  #getMetaValue() {
    const element = document.head.querySelector(`meta[name="csrf-token"]`)
    console.log(element)
    return element.getAttribute("content")
  }
}
