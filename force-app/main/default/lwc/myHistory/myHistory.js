import { LightningElement, track } from 'lwc';
import getAllUserRentals from '@salesforce/apex/RentalController.getAllUserRentals'


export default class MyHistory extends LightningElement {
    @track rentalRecords;
    @track error;
    @track baseUrl = 'https://group-b--june2021b.lightning.force.com/'
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
                        rentalRec.TitleUrl = window.location.origin+'/'+rentalRec.Stock__r.Title__c;
                        
                    }
                })
                this.rentalRecords = result;

            })
            .catch(error=>{
                this.error = error

            })
    }

}