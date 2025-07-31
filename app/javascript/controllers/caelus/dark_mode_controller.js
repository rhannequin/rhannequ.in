import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["darkIcon", "lightIcon"]

  connect() {
    this.updateIconVisibility()
  }

  toggleTheme() {
    document.documentElement.classList.toggle("dark")
    this.updateIconVisibility()
  }

  updateIconVisibility() {
    const isDark = document.documentElement.classList.contains("dark")
    this.darkIconTarget.classList.toggle("hidden", isDark)
    this.lightIconTarget.classList.toggle("hidden", !isDark)
  }
}
