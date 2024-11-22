import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

// Connects to data-controller="datepicker"
export default class extends Controller {
static values = {dates: Array}

  connect() {
    console.log(this.element.value)
    console.log(this.datesValue)
    flatpickr(this.element, {
      minDate: "today",
      maxDate: new Date().fp_incr(30),
      disable: this.datesValue

    })
  }
}
