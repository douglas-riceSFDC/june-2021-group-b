import { LightningElement, track, wire } from "lwc";
import { CurrentPageReference } from "lightning/navigation";
//import getExtraFields from "@salesforce/apex/LightningSelfRegisterController.getExtraFields";
import getTitleById from "@salesforce/apex/TitleAuraService.getTitleById";

export default class TitleDetails extends LightningElement {
  @track currentPageReference;
  @track urlStateParameters;
  @track title;
  @track available;

  @track titleId;

  @wire(CurrentPageReference)
  getStateParameters(currentPageReference) {
    if (currentPageReference) {
      this.urlStateParameters = currentPageReference.state;
      this.setParametersBasedOnUrl();
    }
  }

  setAvailable() {
    if (this.title.Available_Stock__c > 0) {
      this.available = true;
    } else {
      this.available = false;
    }
  }

  setParametersBasedOnUrl() {
    this.titleId = this.urlStateParameters.title;
    getTitleById({ Id: this.titleId })
      .then((result) => {
        console.log("Results - ", result[0]);
        this.title = result[0];
        this.setAvailable();
      })
      .catch((error) => {
        console.log(error);
      });
    console.log(this.title);
  }
}
