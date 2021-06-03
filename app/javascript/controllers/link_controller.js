import { Controller } from "stimulus"
import { Turbo } from "@hotwired/turbo-rails"

export default class extends Controller {
  static values = {
    url: String
  }

  connect() {
    this.element.onclick = this.navigate
  }

  get navigate() {
    return () => { Turbo.visit(this.urlValue) }
  }
}
