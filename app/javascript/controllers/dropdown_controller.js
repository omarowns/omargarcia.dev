import { Controller } from 'stimulus'


export default class extends Controller {
  static classes = [ "expanded" ]

  toggle(event) {
    event.preventDefault()
    this.element.classList.toggle(this.expandedClass)
  }
}
