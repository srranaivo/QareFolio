import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["form", "input", "items"]
  static values = { patient: Number }

  connect() {
    console.log(this.element)
    console.log(this.formTarget)
    console.log(this.itemsTarget)
  }

  send(event) {
    event.preventDefault()

    if (this.inputTarget.value != ''){
      fetch(`${this.formTarget.action}/?query=${this.inputTarget.value}`, {
        method: "GET",
        headers: { "Accept": "application/json" }
      })
      .then(response => response.json())
      .then((data) => {
        console.log(data[0])
        if (data[0]) {
          console.log(this.itemsTarget)
          this.itemsTarget.innerHTML = ''
          this.itemsTarget.insertAdjacentHTML("beforeend",
          `
          <div class="card mb-2 mt-2">
            <div class='card-body p-3'>
              <div class="d-flex align-items-center justify-content-between flex-row">
                <div class="d-flex align-items-center w-100">
                  <h2 class="m-0 text-primary fw-light">
                    ${data[0].first_name}
                    ${data[0].last_name}
                  </h2>
                </div>
                <a class="btn btn-secondary btn-lg px-4" data-action="click->search#add" data-search-id-param="${data[0].id}">
                  <i class="fa-solid fa-plus fs-2 text-primary"></i>
                </a>
              </div>
            </div>
          </div>
          `
          )
        }
        // this.formTarget.outerHTML = data.form
      })
    }
  }

  add(e) {
    console.log('add this patient to the tour')
    console.log(e.params.id)
    fetch("consultations",
    {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({id: e.params.id})
    })
    .then(response => response.json())
    .then((data) => {
      window.location = data['url'];
    })
  }
}
