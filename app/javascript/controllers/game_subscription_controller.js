import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { gameId: Number }
  static targets = ["players"]

  connect() {
    console.log("is it on?", this.gameIdValue)
    this.channel = createConsumer().subscriptions.create(
      { channel: "GameChannel", id: this.gameIdValue },
      { received: data => this.#insertPlayerOrGoToDilemma(data) }
    )
    console.log(`Subscribe to the game with the id ${this.gameIdValue}.`)
  }

  disconnect() {
    console.log("disconnecting!")
    this.channel.unsubscribe()
  }

  #insertPlayerOrGoToDilemma(data) {
    console.log({data})
    // window.location.replace(data)

    if (this.#isValidHttpUrl(data)) {
      console.log("THIS IS A VALID URL")
      window.location.href = data
    } else {
      console.log("this is not a valid url. Continue to insert player")
      // this.playersTarget.insertAdjacentHTML("beforeend", data)
    }
  }

  #isValidHttpUrl(string) {
    let url;
    try {
      url = new URL(string);
    } catch (_) {
      return false;
    }
    return url.protocol === "http:" || url.protocol === "https:";
  }
}
