import { Controller } from "@hotwired/stimulus"
import { patch } from "@rails/request.js"

export default class extends Controller {
  static classes = ["active"]

  drag(event) {
    event.target.classList.add(...this.activeClasses)
    let swapItem = this.elementAtCursor(event) || event.target
    if (this.element !== swapItem.parentNode) return
    swapItem = (swapItem !== event.target.nextSibling ? swapItem : swapItem.nextSibling)
    this.element.insertBefore(event.target, swapItem)
  }

  dragend(event) {
    event.target.classList.remove(...this.activeClasses)
    const index = [...this.element.children].indexOf(event.target)
    patch(event.target.dataset.sortUrl, { query: {index: index} })
  }

  elementAtCursor(event) {
    return document.elementFromPoint(event.clientX, event.clientY)
  }
}