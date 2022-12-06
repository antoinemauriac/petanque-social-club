import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="selection"
export default class extends Controller {
  static targets = ["player", "divplayer"]

  connect() {
    console.log("helu");
  }

  background(event) {
    event.preventDefault
    this.playerTargets.forEach((target) => {
      target.classList.toggle("background-blue")
    })
  }
}
