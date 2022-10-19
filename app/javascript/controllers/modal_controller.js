import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  connect() {
    console.log("connected")
    $('#remote_modal').hide();
    $('#topTurboFrame').html('<turbo-frame id="remote_modal" target="_top"></turbo-frame>');
  }
}
