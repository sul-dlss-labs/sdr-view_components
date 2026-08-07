import { Controller } from '@hotwired/stimulus'
import * as bootstrap from 'bootstrap'

// Drives a <select> that stands in for a tab list on narrow viewports (see
// TabListComponent's `collapse_below` option). Selecting an option shows the
// corresponding tab; activating a tab some other way (e.g. clicking the tab
// list above the collapse breakpoint) keeps the select's value in sync.
export default class extends Controller {
  static targets = ['select']

  change (event) {
    bootstrap.Tab.getOrCreateInstance(document.getElementById(event.target.value)).show()
  }

  sync (event) {
    this.selectTarget.value = event.target.id
  }
}
