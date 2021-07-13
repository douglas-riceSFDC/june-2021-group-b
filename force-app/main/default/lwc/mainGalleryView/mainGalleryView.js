import { LightningElement, api, track } from 'lwc';
import getNewAndFeaturedTitles from '@salesforce/apex/TitleAuraService.getNewAndFeaturedTitles';

export default class MainGalleryView extends LightningElement {
    @api limit;
    @track titles;

    connectedCallback() {
        getNewAndFeaturedTitles({ limiter: this.limit})
            .then(result => {
                this.titles = result;
            })
            .catch(error => {
                console.error('Error occured'. error);
            });
    }
}