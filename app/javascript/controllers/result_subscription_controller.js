  import { Controller } from "@hotwired/stimulus"
  import { createConsumer } from "@rails/actioncable"

  export default class extends Controller {
    static values = { dilemmaId: Number }
    static targets = ["players"]

    connect() {
      this.channel = createConsumer().subscriptions.create(
        { channel: "DilemmaChannel", id: this.dilemmaIdValue },
        {
          received: data => {
            console.log("Received data:", data)
            this.playersTarget.insertAdjacentHTML("beforeend", data)
          }
        }
      )
      console.log(`Subscribed to the dilemma with the id ${this.dilemmaIdValue}`)
    }
  }
