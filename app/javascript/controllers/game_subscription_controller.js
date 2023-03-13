import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { gameId: Number }
  static targets = ["players"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "GameChannel", id: this.gameIdValue },
      { received: data => this.playersTarget.insertAdjacentHTML("beforeend", data) }
    )
    console.log(`Subscribe to the game with the id ${this.gameIdValue}.`)
  }
}
