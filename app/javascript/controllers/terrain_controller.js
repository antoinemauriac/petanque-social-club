import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["fields", "cartes", "field", "carte"]

  connect() {

  }

  showcartes(event) {
    event.preventDefault();
    console.log(this.fieldTarget.classList);
    this.fieldTarget.classList.remove("active")
    this.fieldsTarget.classList.add("d-none")
    this.carteTarget.classList.add("active")
    this.cartesTarget.classList.remove("d-none")
  }

  showfields(event) {
    event.preventDefault();
    this.fieldTarget.classList.add("active")
    this.fieldsTarget.classList.remove("d-none")
    this.carteTarget.classList.remove("active")
    this.cartesTarget.classList.add("d-none")
  }

}
