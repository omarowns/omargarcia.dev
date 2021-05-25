import ToggleController from "./toggle_controller"

export default class extends ToggleController {
  static values = {
    active: Boolean,
    locale: String
  }

  static classes = [ "active" ]

  static targets = [ "dot" ]

  initialize() {
    this.activeValue = this.localeValue === "en"
  }

  switch(event) {
    event.preventDefault()
    this.activeValue = !this.activeValue
    this.dotTarget.classList.toggle(this.activeClass)

    window.location.search = this.localeSearchParam
  }

  get localeSearchParam() {
    let searchParams = new URLSearchParams()
    searchParams.append('locale', this.switchedLocaleValue)
    return searchParams
  }

  get switchedLocaleValue() {
    if (this.localeValue === "es") {
      return "en"
    } else {
      return "es"
    }
  }
}
