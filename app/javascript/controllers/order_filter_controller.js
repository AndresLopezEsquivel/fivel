import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="order-filter"
export default class extends Controller {
  static targets = ["order"]

  connect() {
    console.log("controller for filtering sales connected")
  }

  filter(event) {
    const filterValue = event.target.value;
  }
}
