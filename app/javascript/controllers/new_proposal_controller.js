import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['callWrapper', 'callInput', 'budgetInput'];
  static values = {
    types: Array,
    selectedType: Object,
  };

  connect() {
    console.log(this.typesValue);
    this.selectedTypeValue = this.typesValue.find((item, index) => index == 0);
    if (this.selectedTypeValue.call_based) {
      this.callWrapperTarget.classList.remove('hidden');
    } else {
      this.callWrapperTarget.classList.add('hidden');
      this.callInputTarget.selectedIndex = -1;
    }
    this.budgetInputTarget.setAttribute(
      'max',
      this.selectedTypeValue.max_budget
    );
  }

  makeChanges(e) {
    this.selectedTypeValue = this.typesValue.find(
      (item) => item.id == e.target.value
    );
  }

  selectedTypeValueChanged() {
    if (this.selectedTypeValue.call_based) {
      this.callWrapperTarget.classList.remove('hidden');
    } else {
      this.callWrapperTarget.classList.add('hidden');
      this.callInputTarget.selectedIndex = -1;
    }
    this.budgetInputTarget.setAttribute(
      'max',
      this.selectedTypeValue.max_budget
    );
  }
}
