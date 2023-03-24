import { Controller } from '@hotwired/stimulus'

/**
 * @description Controls the "typing effect" of new messages coming in
 */
export default class extends Controller {

  static targets = ['message']

  messageTargetConnected(element) {
    this.element.scrollTop = this.element.scrollHeight
  }
}
