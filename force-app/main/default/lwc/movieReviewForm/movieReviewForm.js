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

  @track selectedRating = 0;

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

  handleRating20() {
    if (this.rating20 === false) {
      this.rating20 = true;
      this.rating40 = false;
      this.rating60 = false;
      this.rating80 = false;
      this.rating100 = false;
      this.selectedRating = 20;
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
      this.selectedRating = 40;
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
      this.selectedRating = 60;
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
      this.selectedRating = 80;
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
      this.selectedRating = 100;
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
    this.selectedRating = 0;
  }
}
