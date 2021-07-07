import { LightningElement, api, track } from "lwc";

export default class TitleDetails extends LightningElement {
  @api title;
  @track available;
  @track clickedButtonLabel;

  connectedCallback() {
    if (this.title.Available_Stock__c > 0) {
      this.available = true;
    } else {
      this.available = false;
    }
  }

  handleClick(event) {
    this.clickedButtonLabel = event.target.label;
  }
}
