import { LightningElement, track, wire } from "lwc";
import { subscribe, MessageContext } from "lightning/messageService";
import SELECTED_TITLE_MC from "@salesforce/messageChannel/Selected_Title__c";

export default class TitleDetails extends LightningElement {
  @wire(MessageContext) messageContext;
  @track title;
  @track available = true;
  @track modalPopUpToggleFlag = false;

  connectedCallback() {
    this.subscribeToSelectedTitle();

    if (this.title != null)
      if (this.title.Available_Stock__c > 0) {
        this.available = true;
      } else {
        this.available = false;
      }
  }

  subscribeToSelectedTitle() {
    subscribe(this.messageContext, SELECTED_TITLE_MC, (message) =>
      this.handleSelectedTitleMessage(message)
    );
  }

  handleSelectedTitleMessage(message) {
    this.title = message.title;
  }

  // handleRent(event) {
  //  Stub Function for when we implement rental system from button
  // }
}
