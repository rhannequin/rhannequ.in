import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["lat", "lng", "utc"]

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
          this.setTimezoneFromLocation()
        }
      )
    }
  }

  setTimezoneFromLocation() {
    if (!this.hasUtcTarget) return

    const now = new Date()
    const utcOffsetMinutes = -now.getTimezoneOffset()
    const hours = Math.floor(Math.abs(utcOffsetMinutes) / 60.0)
    const minutes = Math.abs(utcOffsetMinutes) % 60

    // Round minutes to nearest 15-minute interval
    const roundedMinutes = Math.round(minutes / 15.0) * 15
    const adjustedHours = hours + Math.floor(roundedMinutes / 60.0)
    const finalMinutes = roundedMinutes % 60

    // Ensure we don't exceed 12 hours
    const clampedHours = Math.min(adjustedHours, 12)

    const sign = utcOffsetMinutes >= 0 ? "+" : "-"
    const formattedHours = clampedHours.toString().padStart(2, "0")
    const formattedMinutes = finalMinutes.toString().padStart(2, "0")

    const timezoneValue = `${sign}${formattedHours}:${formattedMinutes}`

    const select = this.utcTarget
    for (let option of select.options) {
      if (option.value === timezoneValue) {
        option.selected = true
        break
      }
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
