import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "individual", "container", "label", "textField" ]

  removePassenger() {
    if (this.individualTargets.length > 1) {
      const last_individual = this.individualTargets.at(-1)
      last_individual.remove()
    } else {
      alert('Minimum 1 passenger!')
    }
  }

  addPassenger() {
    if (this.individualTargets.length < 4) {
      this.clone = this.individualTarget.cloneNode(true)
      this.containerTarget.appendChild(this.clone)
      this.#fixInputs()
      this.#fixLabels()
    } else {
      alert('Maximum 4 passengers!')
    }
  }

  #fixInputs() {
    const index = this.individualTargets.length - 1
    this.textFieldTargets.forEach(text_input => {
      if (this.clone.contains(text_input)) {

        // fix name attribute with correct index so when form submission fails
        // the form data is not lost
        const name =  text_input.getAttribute("name").replace(/\[(\d+)\]/, `[${index}]`);
        text_input.value = ""
        text_input.setAttribute("name", name)

        // fix id so that label is pointing to correct input element
        const id =  text_input.getAttribute("id").replace(/_(\d+)_/, `_${index}_`);
        text_input.setAttribute("id", id)
      }
    })
  }

  #fixLabels() {
    const index = this.individualTargets.length - 1
    this.labelTargets.forEach(label => {
      if (this.clone.contains(label)) {
        const for_value =  label.getAttribute("for").replace(/_(\d+)_/, `_${index}_`);
        label.setAttribute("for", for_value)
      }
    })
  }

}
