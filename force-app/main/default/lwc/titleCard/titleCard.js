import { LightningElement, api, wire } from "lwc";
import { NavigationMixin } from "lightning/navigation";

import { publish, MessageContext } from "lightning/messageService";
import SELECTED_TITLE_MC from "@salesforce/messageChannel/Selected_Title__c";

export default class TitleCard extends NavigationMixin(LightningElement) {
  @api title;

  @wire(MessageContext)
  messageContext;

  handleTitleSelection() {
    this[NavigationMixin.Navigate]({
      type: "comm__namedPage",
      attributes: {
        pageName: "title-detail-page"
      },
      state: {
        title: this.title.Id
      }
    });
    console.log("firing event" + this.title.Name);
    const payload = { title: this.title };
    publish(this.messageContext, SELECTED_TITLE_MC, payload);
  }
}
