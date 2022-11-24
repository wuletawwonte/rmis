import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['call'];

  connect() {
    console.log('New proposal controller');
  }

  makeChanges() {
    console.log('Make is done');
    this.callTarget.classList.remove('hidden');
  }
}
