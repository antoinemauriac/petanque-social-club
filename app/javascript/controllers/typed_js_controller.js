import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

// Connects to data-controller="typed-js"
export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: [ "SOCIAL", "CLUB", "PETANQUE" ],
      typeSpeed: 200,
      loop: false,
      loopCount: 2
    })
  }
}
