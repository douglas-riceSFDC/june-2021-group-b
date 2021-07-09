import { LightningElement, api, track } from 'lwc';
import getRecommendedTitles from '@salesforce/apex/RecommendedMovies.getRecommendedTitles';

export default class RecommendedMovies extends LightningElement {
    @api titles;
    @track records;

    connectedCallback() {
        getRecommendedTitles()
            .then(result => {
                console.log('Results - ', result[0]);
                this.records = result;
            })
            .catch(error => {
                console.log(error);
            });
    }
}