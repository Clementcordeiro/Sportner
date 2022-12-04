import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller { 
  static targets = [ "Date", "Calendar" ]
  connect() {
    console.log("hello")
    flatpickr(this.CalendarTarget, { mode: "range" })
    flatpickr(this.DateTarget, { })
  }
}
