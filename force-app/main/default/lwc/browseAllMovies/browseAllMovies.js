import { LightningElement, api, track } from 'lwc';
import getFilteredTitles from '@salesforce/apex/BrowseAllFiltered.getFilteredTitles';

export default class BrowseAllMovies extends LightningElement {
    @api titles;
    @track records;
    @track genre = "";
    @track orderBy = "";

    handleSelectedGenreEvent(event) {
        this.genre = event.target.value;
        if(this.genre !== "" && this.orderBy !== "") {
            console.log(this.orderBy);
            getFilteredTitles(this.genre, this.orderBy);
        }
    }

    handleSelectedOrderEvent(event) {
        this.orderBy = event.target.value;
        if(this.orderBy !== "" && this.genre !== "") {
            getFilteredTitles(this.genre, this.orderBy);
        }
    }
}