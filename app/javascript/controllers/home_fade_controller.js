import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="home-fade"
export default class extends Controller {
  connect() {
    console.log('Connected Home Fade JS');

    const logo = document.querySelector(".logo")
    const menu = document.querySelector(".menu")
    const navbar = document.querySelector(".navbar")

    setTimeout(() => {
      menu.classList.add("fade-in")
    }, 2000);

    setTimeout(() => {
      logo.classList.add("fade-out")
    }, 2000);
  }
}
