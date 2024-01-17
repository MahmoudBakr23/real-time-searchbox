import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-form"
export default class extends Controller {
  connect() {
    this.setupSearch();
    this.setupTimer();
    this.setupHiddenField();
  }
  setupSearch() {
    // Set up event listener for input field to trigger instant search
    const input = this.element.querySelector('[name="query"]');
    input.addEventListener("input", this.search.bind(this));
  }
  setupTimer() {
    this.timeout = null;
  }
  setupHiddenField(boolean) {
    // Set up the hidden field element
    const hiddenField = this.element.querySelector('[name="complete_query"]');
    hiddenField.value = boolean;
  }
  search() {
    this.setupHiddenField("false")
    // Clear the timer to restart the countdown for delayed search
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this.element.requestSubmit()
    }, 200)
    // Start the countdown for delayed search after typing stops
    this.startTimer();
  }
  startTimer() {
    // Set up the timer for delayed search
    this.timeout = setTimeout(() => {
      // Set the value of a hidden field to indicate a complete query
      this.setupHiddenField("true")
      // Submit the form for delayed search
      this.element.requestSubmit();
    }, 3000);
  }
}
