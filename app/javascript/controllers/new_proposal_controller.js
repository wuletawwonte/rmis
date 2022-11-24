import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['call'];
  static values = {
    types: Array,
    selectedType: Object,
  };

  connect() {
    console.log('New proposal controller');
    console.log(this.typesValue);
    this.callVisibleValue = false;
  }

  makeChanges(e) {
    this.selectedTypeValue = this.typesValue.find(
      (item) => item.id == e.target.value
    );
  }

  selectedTypeValueChanged() {
    if (this.selectedTypeValue.call_based) {
      this.callTarget.classList.remove('hidden');
    } else {
      this.callTarget.classList.add('hidden');
    }
  }
}
