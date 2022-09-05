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
/*     if(this.checkboxTarget.checked) {
      fetch(`/consultations/${this.consultationValue}/validated_cares`, {
        method: "POST",
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "X-CSRF-Token": this.#getMetaValue()
        },
        body: JSON.stringify({"care_id": e.target.value})
      })
    } else { */
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
/*   #getMetaValue() {
    const element = document.head.querySelector(`meta[name="csrf-token"]`)
    console.log(element)
    return element.getAttribute("content")
  } */
/* } */
