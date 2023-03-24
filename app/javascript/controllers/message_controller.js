import { Controller } from '@hotwired/stimulus'
import Typed from 'typed.js'

/**
 * @description Controls the "typing effect" of new messages coming in
 */
export default class extends Controller {
  static values = {
    animate: {
      type: Boolean,
      default: false,
    },
  }

  static targets = ['text']

  initialize() {
    console.log('message initialized')
  }

  connect() {

    if (!this.animateValue) {
      return
    }
    // Prevents a flash of the text before JS connects
    this.element.hidden = false

    const html = this.textTarget.innerHTML

    this.textTarget.innerHTML = ''

    new Typed(this.textTarget, {
      strings: [html],
      typeSpeed: 15,
      showCursor: false,
    })
  }
}
