import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = {
    dilemmaId: Number,
    one: Number,
    two: Number,
  }
  static targets = ["players", "button", "scenaria", "scenarib"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "DilemmaChannel", id: this.dilemmaIdValue },
      {
        received: (data) => {
          this.#insertPlayerAnswerOrGoToDilemma(data)
        },
      }
    )
    console.log(`Subscribed to the dilemma with the id ${this.dilemmaIdValue}`)
  }

  disconnect() {
    console.log("disconnecting!")
    this.channel.unsubscribe()
  }

  #insertPlayerAnswerOrGoToDilemma(data) {
    if (this.#isValidHttpUrl(data)) {
      console.log("THIS IS A VALID URL")
      window.location.href = data
    } else if(typeof data.match === 'function') {
      const matchResult = data.match(/data-scenario-id="(\d{1,3}")/)
      console.log('Regex result: ',{matchResult})
      const scenarioId = Number.parseInt(matchResult[1])
      const oneId = this.oneValue
      const twoId = this.twoValue
      console.log({
        scenarioId,
        oneId,
        twoId,
      })
      if (scenarioId === oneId) {
        const newAvatarElement = this.#buildAvatarWrapper(data)
        console.log({newAvatarElement})
        this.scenariaTarget.insertAdjacentElement('beforeend', newAvatarElement)
        // insert in the div with target one
      } else {
        const newAvatarElement = this.#buildAvatarWrapper(data)
        console.log({newAvatarElement})
        this.scenaribTarget.insertAdjacentElement('beforeend', newAvatarElement)
        // insert in the div with target two
      }
    } else {
      console.log('Data: ',{ data })
      let sum = data.results >= data.players
      if (sum) {
        this.buttonTarget.classList.remove("d-none")
        this.buttonTarget.classList.add("appear")
      }
      this.playersTarget.insertAdjacentHTML("beforeend", data.message)
      document.getElementById('resulta').innerHTML='Result A Count:'+ data.result_a
      document.getElementById('resultb').innerHTML='Result B Count:'+ data.result_b
      document.getElementById('score').innerHTML='Your Score:'+ data.score
    }
  }

  #buildAvatarWrapper(data) {
    const element = document.createElement("div")
    // element.classList.add("results-avatars-grid-items")
    // const avatar = new DOMParser().parseFromString(data, "text/xml")
    // element.appendChild(avatar.documentElement)
    element.innerHTML = data
    console.log("avatar", data)
    return element
  }

  #isValidHttpUrl(string) {
    let url
    try {
      url = new URL(string)
    } catch (_) {
      return false
    }
    return url.protocol === "http:" || url.protocol === "https:"
  }
}
