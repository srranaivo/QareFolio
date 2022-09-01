import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="checklist"
export default class extends Controller {
  static targets = ['validated_cares', 'checkbox']
  static values = {consultation: Number}

  connect() {
    console.log("is checked:", this.checkboxTarget.checked);
    console.log("care id:", this.checkboxTarget.value);
    console.log("My checklist", this.element)
    console.log("validated:", this.checkboxTarget.dataset.validated);
    }

  checklist(e) {

    this.validated_caresTarget.innerHTML = "Ce soin est effectué"

    if(this.checkboxTarget.checked) {
      fetch(`/consultations/${this.consultationValue}/validated_cares`, {
        method: "POST",
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "X-CSRF-Token": this.#getMetaValue()
        },
        body: JSON.stringify({"care_id": e.target.value})
      })
    } else {
      /* only works if html is rerender after delete  */

      // fetch(`/consultations/${this.consultationValue}/validated_cares/${this.checkboxTarget.dataset.validated}`, {
      //   method: "DELETE",
      //   headers: {
      //     "Accept": "application/json",
      //     "Content-Type": "application/json",
      //     "X-CSRF-Token": this.#getMetaValue()
      //   },
      //   body: JSON.stringify({"care_id": e.target.value})
      // })
    }

  }
  #getMetaValue() {
    const element = document.head.querySelector(`meta[name="csrf-token"]`)
    console.log(element)
    return element.getAttribute("content")
  }
}
