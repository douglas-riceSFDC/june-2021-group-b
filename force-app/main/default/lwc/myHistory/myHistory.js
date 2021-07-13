import { LightningElement, track , api} from 'lwc';
import getAllUserRentals from '@salesforce/apex/RentalController.getAllUserRentals'
import communityBasePath from '@salesforce/community/basePath';

export default class MyHistory extends LightningElement {
    @track rentalRecords;
    @track error;
   
    @track columns = [
        { label: 'Title Name', fieldName: 'TitleUrl', type:'url',
           typeAttributes: {
               label: {
                   fieldName: 'TitleName'
               },
               target : '_blank'
           }
    },
        { label: 'Date Rented', fieldName: 'Date_Rented__c', type: 'date'},
        { label: 'Date Returned', fieldName: 'Date_Returned__c', type: 'date'},
    ];
    
    //https://developer.salesforce.com/docs/component-library/bundle/lightning-datatable/documentation

    connectedCallback(){
        
        getAllUserRentals()
            .then(result=>{
                result.forEach(rentalRec =>{
                    if(rentalRec.Stock__c){
                        rentalRec.TitleName = rentalRec.Stock__r.Title_Name__c;
                        this.titleId = rentalRec.Stock__r.Title__c;
                        rentalRec.TitleUrl = communityBasePath+'/'+'title-detail-page?title='+rentalRec.Stock__r.Title__c;
}
                })
                this.rentalRecords = result;

            })
            .catch(error=>{
                this.error = error

            })
    }
}