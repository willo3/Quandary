  import { Controller } from "@hotwired/stimulus"
  import { createConsumer } from "@rails/actioncable"

  export default class extends Controller {
    static values = { dilemmaId: Number }
    static targets = ["players", "button"]

    connect() {
      this.channel = createConsumer().subscriptions.create(
        { channel: "DilemmaChannel", id: this.dilemmaIdValue },
        {
          received: data => {
            console.log("Received data:", data)
            this.#insertPlayerAnswerOrGoToDilemma(data)
          }
        }
      )
      console.log(`Subscribed to the dilemma with the id ${this.dilemmaIdValue}`)
    }

    disconnect() {
      console.log("disconnecting!")
      this.channel.unsubscribe()
    }

    #insertPlayerAnswerOrGoToDilemma(data) {
      console.log("ANY MESSAGE")
      if (this.#isValidHttpUrl(data)) {
        console.log("THIS IS A VALID URL")
        window.location.href = data
      } else {
        let sum = data.results >= data.players
        console.log(sum)
        if (sum) {
          this.buttonTarget.classList.remove("invisible")
        }

        console.log("this is a player answer")
        this.playersTarget.insertAdjacentHTML("beforeend", data.message)

        document.getElementById('resulta').innerHTML='Result A Count:'+ data.result_a
        document.getElementById('resultb').innerHTML='Result B Count:'+ data.result_b
        document.getElementById('score').innerHTML='Your Score:'+ data.result_b

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
