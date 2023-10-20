import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="cities-select"
export default class extends Controller {
  static targets = ["country", "cities"]

  connect() {
    this.countryTarget.value !== "" && this.loadCities()
  }

  loadCities() {
    const countryCode = this.countryTarget.value

    fetch(`/cities.json?country_code=${countryCode}`)
      .then(response => response.json())
      .then(data => {
        this.citiesTarget.innerHTML = data.options
      })
  }
}
