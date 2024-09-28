import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="loading"
export default class extends Controller {
  connect() {
  }

  showSpinner(event) {
    const spinner = document.querySelector(`#loading-spinner-${event.target.dataset.aquariumId}`);
    if (spinner) {
      spinner.classList.remove("hidden");
    }
  }
}
