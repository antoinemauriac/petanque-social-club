import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["fields", "cartes", "field", "carte"]

  connect() {
  }

  showfields(event) {
    event.preventDefault();
    this.fieldTarget.classList.add("active")
    this.carteTarget.classList.remove("active")
    this.fieldsTarget.classList.remove("d-none")
    this.cartesTarget.classList.add("d-none")
  }

  showcartes(event) {
    event.preventDefault();
    this.fieldTarget.classList.remove("active")
    this.carteTarget.classList.add("active")
    this.fieldsTarget.classList.add("d-none")
    this.cartesTarget.classList.remove("d-none")
  }

}
