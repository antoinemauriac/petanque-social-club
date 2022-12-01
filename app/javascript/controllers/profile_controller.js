import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="display"
export default class extends Controller {
  static targets = ["stats", "badges", "collegues", "stat", "badge", "collegue"]

  connect(event) {
    event.preventDefault
  }

  stats(event) {
    event.preventDefault();
    this.statTarget.classList.add("active")
    this.badgeTarget.classList.remove("active")
    this.collegueTarget.classList.remove("active")
    this.statsTarget.classList.remove("d-none")
    this.badgesTarget.classList.add("d-none")
    this.colleguesTarget.classList.add("d-none")
  }

  badges(event) {
    event.preventDefault();
    this.statTarget.classList.remove("active")
    this.badgeTarget.classList.add("active")
    this.collegueTarget.classList.remove("active")
    this.statsTarget.classList.add("d-none")
    this.badgesTarget.classList.remove("d-none")
    this.colleguesTarget.classList.add("d-none")
  }

  collegues(event) {
    event.preventDefault();
    this.statTarget.classList.remove("active")
    this.badgeTarget.classList.remove("active")
    this.collegueTarget.classList.add("active")
    this.statsTarget.classList.add("d-none")
    this.badgesTarget.classList.add("d-none")
    this.colleguesTarget.classList.remove("d-none")
  }
}
