import { LightningElement, api, track } from 'lwc';
import getFilteredTitles from '@salesforce/apex/BrowseAllFiltered.getFilteredTitles';

export default class BrowseAllMovies extends LightningElement {
    @api titles;
    @track records;
    @track genre;
    @track orderBy = "";

    handleSelectedGenreEvent(event) {
        this.genre = event.target.value;
        if(this.genre !== "" && this.orderBy !== "") {
            getFilteredTitles({genre: this.genre,
                               orderBy: this.orderBy
                })
                .then(result => {
                    console.log('Results - ', result[0]);
                    this.records = result;
                })
                .catch(error => {
                    console.log(error);
                });
        }
    }

    handleSelectedOrderEvent(event) {
        this.orderBy = event.target.value;
        if(this.orderBy !== "" && this.genre !== "") {
            getFilteredTitles({genre: this.genre,
                               orderBy: this.orderBy
                })
                .then(result => {
                    console.log('Results - ', result[0]);
                    this.records = result;
                })
                .catch(error => {
                    console.log(error);
                });
        }
    }
}