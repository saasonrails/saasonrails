import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["name", "slug"]
  static lastSlugValue = null

  connect() {
    this.generateSlug()
  }

  generateSlug() {
    const nameValue = this.nameTarget.value.trim()
    const slugValue = this.slugTarget.value.trim()

    if (slugValue === "" || slugValue === this.constructor.lastSlugValue) {
      const newSlug = nameValue.length > 0 ? this.parameterize(nameValue) : ""
      this.slugTarget.value = newSlug
      this.constructor.lastSlugValue = newSlug
    }
  }

  parameterize(string) {
    return string.toLowerCase().replace(/[^a-z0-9]+/g, "-").replace(/(^-|-$)+/g, "")
  }
}
