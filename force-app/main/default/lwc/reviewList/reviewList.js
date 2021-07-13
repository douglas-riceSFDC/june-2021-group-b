import { LightningElement, api, track, wire } from "lwc";
import getRecentReviews from "@salesforce/apex/MovieReviewAuraService.getRecentReviewsByTitle";
import { subscribe, MessageContext } from "lightning/messageService";
import SELECTED_TITLE_MC from "@salesforce/messageChannel/Selected_Title__c";

export default class ReviewList extends LightningElement {
  @wire(MessageContext) messageContext;
  @track reviews;
  @track limit = 3;
  @api title;
  @track showReviews = false;
  @track moreReviewsLabel;
  @track thereAreNoMoreReviews;

  connectedCallback() {
    this.subscribeToSelectedTitle();
  }

  subscribeToSelectedTitle() {
    subscribe(this.messageContext, SELECTED_TITLE_MC, (message) =>
      this.handleSelectedTitleMessage(message)
    );
  }

  // eslint-disable-next-line no-unused-vars
  handleSelectedTitleMessage(message) {
    this.showReviews = false;
  }

  toggleReviews() {
    this.showReviews = !this.showReviews;
    if (this.showReviews === true) {
      this.loadReviews();
    } else {
      this.limit = 3;
    }
  }

  addMoreReviews() {
    this.limit = this.limit + 3;
    this.loadReviews();
  }

  loadReviews() {
    getRecentReviews({ limiter: this.limit, title: this.title.Id })
      .then((result) => {
        this.reviews = result;
        this.checkForMoreReviews();
      })
      .catch((error) => {
        console.error("Error occured", error);
      });
  }

  checkForMoreReviews() {
    if (this.reviews.length === this.limit) {
      this.thereAreNoMoreReviews = false;
      this.moreReviewsLabel = "See More";
    } else {
      this.thereAreNoMoreReviews = true;
      this.moreReviewsLabel = "No More Reviews";
    }
  }
}
