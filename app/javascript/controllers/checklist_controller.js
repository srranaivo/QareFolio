import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="checklist"
export default class extends Controller {
  static targets = ['validated_cares']
  static values = {id: String}

  connect() {
    console.log("checked:", this.element);
    console.log("My checklist", this.validated_caresTarget.dataset.checklistIdValue)
    }

  checklist() {
    this.validated_caresTarget.innerHTML = "Ce soin est effectué"
    console.log(this.idValue)

    fetch(`/consultations/${this.validated_caresTarget.dataset.checklistIdValue}/validated_cares`, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
  }





}
