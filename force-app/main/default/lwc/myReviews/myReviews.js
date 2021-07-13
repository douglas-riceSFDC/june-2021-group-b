import { LightningElement,track,api } from 'lwc';
import getAllUserReviews from '@salesforce/apex/RentalController.getAllUserReviews';


export default class MyReviews extends LightningElement {
    @api reviewRecords;
    @track error;

    connectedCallback(){
        console.log('Connected.');
        getAllUserReviews()
        .then(result=>{
            this.reviewRecords = result;
            console.log('reviewRecords : => '+reviewRecords);
        })
        .catch(error=>{
            this.error = error;
        })
    }

}
