import { LightningElement, api, track } from "lwc";

import OBJECT from "@salesforce/schema/Movie_Review__c";
import USER_ID from "@salesforce/user/Id";

export default class MovieReviewForm extends LightningElement {
  @api title;
  @track objectApiName = OBJECT;
  @track isModalOpen = false;

  @track rating20 = false;
  @track rating40 = false;
  @track rating60 = false;
  @track rating80 = false;
  @track rating100 = false;

  @track selectedRating;

  openModal() {
    this.isModalOpen = true;
  }
  closeModal() {
    this.isModalOpen = false;
  }

  handleSubmit(event) {
    event.preventDefault();

    const fields = event.detail.fields;
    fields.Reviewer__c = USER_ID;
    fields.Title__c = this.title.Id;
    fields.Rating__c = this.selectedRating;

    this.template.querySelector("lightning-record-edit-form").submit(fields);

    this.closeModal();
  }

  handleSuccess(event) {
    const payload = event.detail.fields;
    console.log(JSON.stringify(payload.Title__c) + "title");
    console.log(JSON.stringify(payload.Review__c) + "review");
    console.log(JSON.stringify(payload.Reviewer__c) + "reviewer");
    console.log(JSON.stringify(payload.Rating__c) + "rating");
  }

  handleRating20() {
    if (this.rating20 === false) {
      this.rating20 = true;
      this.rating40 = false;
      this.rating60 = false;
      this.rating80 = false;
      this.rating100 = false;
      this.selectedRating = 0.2;
    } else {
      this.setRatingsFalse();
    }
  }

  handleRating40() {
    if (this.rating40 === false) {
      this.rating20 = true;
      this.rating40 = true;
      this.rating60 = false;
      this.rating80 = false;
      this.rating100 = false;
      this.selectedRating = 0.4;
    } else {
      this.setRatingsFalse();
    }
  }

  handleRating60() {
    if (this.rating60 === false) {
      this.rating20 = true;
      this.rating40 = true;
      this.rating60 = true;
      this.rating80 = false;
      this.rating100 = false;
      this.selectedRating = 0.6;
    } else {
      this.setRatingsFalse();
    }
  }
  handleRating80() {
    if (this.rating80 === false) {
      this.rating20 = true;
      this.rating40 = true;
      this.rating60 = true;
      this.rating80 = true;
      this.rating100 = false;
      this.selectedRating = 0.8;
    } else {
      this.setRatingsFalse();
    }
  }
  handleRating100() {
    if (this.rating100 === false) {
      this.rating20 = true;
      this.rating40 = true;
      this.rating60 = true;
      this.rating80 = true;
      this.rating100 = true;
      this.selectedRating = 1.0;
    } else {
      this.setRatingsFalse();
    }
  }

  setRatingsFalse() {
    this.rating20 = false;
    this.rating40 = false;
    this.rating60 = false;
    this.rating80 = false;
    this.rating100 = false;
    this.selectedRating = 0.0;
  }
}
