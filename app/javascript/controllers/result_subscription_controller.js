import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { resultId: Number }
  static targets = ["players"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ResultChannel", id: this.resultIdValue },
      {
        received: data => {
          this.playersTarget.insertAdjacentHTML("beforeend", data)
        }
      }
    )
    console.log(`Subscribed to the chatroom with the id ${this.resultIdValue}.`)
  }
}




// this.playersTarget.insertAdjacentHTML("beforeend", data)
