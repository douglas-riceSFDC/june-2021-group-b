import { LightningElement, api, track, wire } from "lwc";
import getUserRentals from "@salesforce/apex/RentalController.getUserRentals";

export default class RentedTitlesList extends LightningElement {
  @track records;

  connectedCallback() {
    console.log("Connected.");

    getUserRentals()
      .then((result) => {
        console.log("Results - ", result[0]);
        this.records = result;
      })
      .catch((error) => {
        console.log(error);
      });
  }

  // one way
  //@wire (getMyRentals) rentals;

  // second way
  // @wire(getUserRentals)
  //     wiredRentals({
  //         data, error
  //     }){
  //             //let today = new Date().toLocaleDateString()
  //             console.log("DATA ===>> ",data);
  //             console.log("ERROR ===>> ",error);
  //         if(data){
  //             this.records = data;
  //             this.errors = undefined;

  //         }
  //         if(error){
  //             this.errors = error;
  //             this.records = undefined;
  //         }

  //     }
}
