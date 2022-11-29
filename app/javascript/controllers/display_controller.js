import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="display"
export default class extends Controller {
  static targets = ["classements", "matchs", "murs", "classement", "match", "mur"]

  connect(event) {
    event.preventDefault
  }

  classements(event) {
    event.preventDefault();
    this.classementTarget.classList.add("active")
    this.matchTarget.classList.remove("active")
    this.murTarget.classList.remove("active")
    this.classementsTarget.classList.remove("d-none")
    this.matchsTarget.classList.add("d-none")
    this.mursTarget.classList.add("d-none")
  }

  matchs(event) {
    event.preventDefault();
    this.classementTarget.classList.remove("active")
    this.matchTarget.classList.add("active")
    this.murTarget.classList.remove("active")
    this.classementsTarget.classList.add("d-none")
    this.matchsTarget.classList.remove("d-none")
    this.mursTarget.classList.add("d-none")
  }

  murs(event) {
    event.preventDefault();
    this.classementTarget.classList.remove("active")
    this.matchTarget.classList.remove("active")
    this.murTarget.classList.add("active")
    this.classementsTarget.classList.add("d-none")
    this.matchsTarget.classList.add("d-none")
    this.mursTarget.classList.remove("d-none")
  }
}
