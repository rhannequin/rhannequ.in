import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["lat", "lng"]

  connect() {
    this.boundCloseOnEscape = this.closeOnEscape.bind(this)
    document.addEventListener("keydown", this.boundCloseOnEscape)
  }

  disconnect() {
    document.removeEventListener("keydown", this.boundCloseOnEscape)
  }

  detect(event) {
    event.preventDefault()

    if ("geolocation" in navigator) {
      navigator.geolocation.getCurrentPosition(
        (position) => {
          if (this.hasLatTarget && this.hasLngTarget) {
            this.latTarget.value = position.coords.latitude.toFixed(4)
            this.lngTarget.value = position.coords.longitude.toFixed(4)
          }
        }
      )
    }
  }

  close() {
    const modalFrame = document.getElementById("location_modal")
    if (modalFrame) {
      modalFrame.innerHTML = ""
    }
  }

  cancel(event) {
    event.preventDefault()
    this.close()
  }

  closeOnEscape(event) {
    if (event.key === "Escape") {
      this.close()
    }
  }
}
