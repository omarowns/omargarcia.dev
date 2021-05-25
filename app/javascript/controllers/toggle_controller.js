import { Controller } from "stimulus"

export default class extends Controller {
  static values = {
    active: Boolean
  }

  static classes = [ "active" ]

  static targets = [ "dot" ]

  connect() {
    if (this.activeValue) {
      this.dotTarget.classList.add(this.activeClass)
    }
  }

  switch(event) {
    event.preventDefault()
    this.activeValue = !this.activeValue
    this.dotTarget.classList.toggle(this.activeClass)
  }
}
