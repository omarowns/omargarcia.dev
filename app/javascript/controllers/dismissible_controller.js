import { Controller } from "stimulus"

export default class extends Controller {
  dismiss(event) {
    event.currentTarget.closest('[data-dismissible~="true"]').remove()
  }
}
