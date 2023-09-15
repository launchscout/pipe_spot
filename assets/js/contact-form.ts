import { LitElement, html } from "lit";
import { customElement, property, state } from "lit/decorators.js";
import { liveState, liveStateConfig } from 'phx-live-state';

@customElement('contact-form')
@liveState({
  topic: 'contact_form:all'
})
export class ContactFormElement extends LitElement {

  @liveStateConfig('url')
  url: string = '';

  render() {
    return html`<h1>Hello there!</h1>`
  }
}