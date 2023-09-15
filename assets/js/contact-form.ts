import { LitElement, html } from "lit";
import { customElement, property, state } from "lit/decorators.js";
import { liveState, liveStateConfig, liveStateProperty } from 'phx-live-state';

@customElement('contact-form')
@liveState({
  events: {
    send: ['create-contact']
  },
  topic: 'contact_form:all'
})
export class ContactFormElement extends LitElement {

  @liveStateConfig('url')
  @property()
  url: string = '';

  @state()
  @liveStateProperty()
  complete: Boolean = false;

  render() {
    if (this.complete) {
      return html`<div>Thank you for being a friend :)</div>`
    } else {
      return html`
        <div>Please to give us your precious data</div>
        <form @submit=${this.submitForm}>
          <div>
            <label>Name</label>
            <input name="name" required />
          </div>
          <div>
            <label>Email</label>
            <input name="email" type="email" required />
          </div>
          <div>
            <label>Phone Number</label>
            <input name="phone_number" required />
          </div>
          <button>Save stuff</button>
        </form>
      `;
    }
  }

  submitForm(e: SubmitEvent) {
    e.preventDefault();
    const form = e.target as HTMLFormElement;
    const formData = new FormData(form);
    const data = Object.fromEntries(formData.entries());
    this.dispatchEvent(new CustomEvent('create-contact', { detail: data }));
  }
}