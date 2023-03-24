import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  connect() {
    const messageTimer = 6000
    const fadeOutTimer = 300

    setTimeout(() => {
      this.element.classList.add('opacity-0')
      setTimeout(() => {
        this.element.remove()
      }, fadeOutTimer)
    }, messageTimer)
  }
}
