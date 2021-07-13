import { LightningElement, api, track } from 'lwc';
import getNewAndFeaturedTitles from '@salesforce/apex/TitleAuraService.getNewAndFeaturedTitles';

export default class NewAndFeaturedMovies extends LightningElement {
    @api limit;

    @track records;

    connectedCallback() {
        getNewAndFeaturedTitles({ limiter: this.limit})
            .then(result => {
                console.log('result: ' + result[0]);
                this.records = result;
            })
            .catch(error => {
                console.error('Error occured'. error);
            });
        }
}