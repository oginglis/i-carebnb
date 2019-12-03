import "bootstrap";
import flatpickr from 'flatpickr'
import { initMapbox } from "./map";
import { initAutocomplete } from "../plugins/init_autocomplete.js";
import { initSweetalert } from '../plugins/init_sweetalert';
import 'flatpickr/dist/flatpickr.min.css'

initAutocomplete();
initMapbox();


initSweetalert('#sweet-alert-demo', 'new_booking', {
  title: "Thank You For Your Booking Request",
  text: "A booking request has been sent to the host who must confirm your booking.",
  icon: "success",
  confirmButtonColor: '#8CD4F5'
}, (_value, form) => form.submit());

initSweetalert('.ollie-sweet-alert', 'cancel_booking', {
  title: "Are you sure?",
  icon: "warning",
  buttons: true,
  dangerMode: true,
  confirmButtonColor: '#8CD4F5'
}, (value, form) => {
  if (value) {
    form.submit()
  }
});


let element = document.querySelector(".past_unavailability");
if (element) {
  let dates = JSON.parse(element.dataset.past)
  flatpickr('#unavailability_date', {
    mode: "multiple",
    dateFormat: "d-m-Y",
    disable: dates
  })

}

if (element) {
  let startDate = document.querySelector('.form-inputs').dataset.startdate;
  let endDate = document.querySelector('.form-inputs').dataset.enddate;
  let dates = JSON.parse(element.dataset.past)
  flatpickr('#test-picker', {
    mode: "range",
    dateFormat: "d-m-Y",
    disable: dates,
    defaultDate: [startDate, endDate]

  })

}

let startDate = document.querySelector('.form-row').dataset.startdate;
let endDate = document.querySelector('.form-row').dataset.enddate;
flatpickr('#ollie-date-picker', {
    mode: "range",
    dateFormat: "d-m-Y",
    defaultDate: [startDate, endDate]

})

flatpickr('.room-show-picker')

