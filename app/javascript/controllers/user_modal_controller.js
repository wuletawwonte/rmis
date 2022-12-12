import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="user-modal"
export default class extends Controller {
  static targets = ['innerdiv'];

  connect() {
    this.element.setAttribute('x-show', true);
    this.innerdivTarget.setAttribute('x-show', true);
  }

  closeModal() {
    this.element.remove();
  }
}
