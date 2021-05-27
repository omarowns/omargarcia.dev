import { Controller } from 'stimulus'


export default class extends Controller {
  static targets = [ "loader" ]

  static values = {
    dataEndpoint: String
  }

  connect() {
    fetch(this.dataEndpointValue)
      .then(response => response.json())
      .then(data => this._loadGraph(data.donut_chart_data))
      .then(() => this.loaderTarget.remove())
  }

  _loadGraph(data) {
    new Morris.Donut({
      element: this.element,
      data: data
    })
  }
}
