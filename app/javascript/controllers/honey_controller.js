import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static values = {
    supply: {
      type: Number,
      default: 4,
    },
  }

  static targets = ['jar']

  connect() {
    this.docStyle = document.documentElement.style
  }

  resupply() {
    this.honeyBounce()

    if (this.supplyValue == 4) return

    this.supplyValue = 4
    this.docStyle.setProperty('--honey-supply', '0')
  }

  submit(e) {
    if (this.supplyValue == 0) {
      e.preventDefault()
    } else {
      setTimeout(() => {
        e.target.reset()
      }, 200)
    }

    this.updateSupply()
    this.honeyBounce()
  }

  honeyBounce() {
    if (this.jarTarget.dataset.state === 'bounce') return

    this.jarTarget.dataset.state = 'bounce'
    setTimeout(() => {
      delete this.jarTarget.dataset.state
    }, 400)
  }

  updateSupply() {
    switch (this.supplyValue) {
      case 4:
        this.docStyle.setProperty('--honey-supply', '35%')
        --this.supplyValue
        break
      case 3:
        this.docStyle.setProperty('--honey-supply', '50%')
        --this.supplyValue
        break
      case 2:
        this.docStyle.setProperty('--honey-supply', '75%')
        --this.supplyValue
        break
      case 1:
        this.docStyle.setProperty('--honey-supply', '100%')
        --this.supplyValue
        break
      default:
        break
    }
  }
}
