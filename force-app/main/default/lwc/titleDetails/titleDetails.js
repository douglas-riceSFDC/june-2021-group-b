import { LightningElement, track, wire } from "lwc";
import { CurrentPageReference } from "lightning/navigation";
//import getExtraFields from "@salesforce/apex/LightningSelfRegisterController.getExtraFields";
import getTitleById from "@salesforce/apex/TitleAuraService.getTitleById";
import getAvailableStockForTitle from "@salesforce/apex/StockAuraService.getAllAvailableStockForTitle";
import rentStock from "@salesforce/apex/StockController.rentStock";

export default class TitleDetails extends LightningElement {
  @track currentPageReference;
  @track urlStateParameters;
  @track title;
  @track stock;
  @track areStockAvailable;
  @track rentDisabledMessage;

  @track titleId;

  @wire(CurrentPageReference)
  getStateParameters(currentPageReference) {
    if (currentPageReference) {
      this.urlStateParameters = currentPageReference.state;
      this.setParametersBasedOnUrl();
    }
  }

  setStockAvailability() {
    if (this.title.Available_Stock__c > 0) {
      this.areStockAvailable = true;
    } else {
      this.areStockAvailable = false;
      this.rentDisabledMessage = "Out of Stock";
    }
  }

  setParametersBasedOnUrl() {
    this.titleId = this.urlStateParameters.title;
    getTitleById({ Id: this.titleId })
      .then((result) => {
        this.title = result[0];
        this.setStockAvailability();
      })
      .catch((error) => {
        console.log(error);
      });
  }

  handleRental() {
    getAvailableStockForTitle({ titleId: this.titleId })
      .then((result) => {
        this.updateStock(result[0]);
      })
      .catch((error) => {
        console.log(error);
      });
  }

  updateStock(s) {
    rentStock({ stock: s })
      .then(() => {
        this.changeTitleInfoOnPage();
      })
      .catch((error) => {
        console.log(error);
      });
  }

  changeTitleInfoOnPage() {
    this.areStockAvailable = false;
    this.rentDisabledMessage = "Movie Succesfully Rented";
    this.title.Available_Stock__c--;
  }
}
