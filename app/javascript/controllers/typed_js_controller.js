import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

// Connects to data-controller="typed-js"
export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["Bienvenue à toi bouliste en herbe 🚀",
      "Pour avoir des stats, c'est très simple 👀",
      "Il faut jouer des matchs dans la vraie vie 🤠",
      "Invite tous les boulistes que tu connais à s'inscrire sur l'app 📱",
      "Ajoute-les à ta ”liste des collègues”",
      "Affronte-les en doublette dans des mini championnats 🤯",
      "Rentre les scores dans l'app",
      "Et reviens me voir quand tu auras enchaîné les carreaux 💙"],
      typeSpeed: 30,
      backDelay: 2000,
      loop: true
    })
  }
}
