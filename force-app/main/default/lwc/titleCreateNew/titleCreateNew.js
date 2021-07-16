import UserPreferencesShowCityToExternalUsers from '@salesforce/schema/User.UserPreferencesShowCityToExternalUsers';
import { LightningElement, track, api } from 'lwc';

export default class titleCreateNew extends LightningElement {
    @track titleSearchValue;
    @track stockNumber;
    @track titleSubmit;
    @track show = false;

    @api movieTitle = '';


    handleChange(event){
        
        console.log('Value changed!');
        
        var selectedImdbId = event.target.value;
        console.log("This is the selected title: ");
        console.log("ImdbId: ", selectedImdbId);
        
        for (var i = 0; i < this.movieTitle.length; i++){
            if ( this.movieTitle[i].imdbID == selectedImdbId){
                this.titleSubmit = this.movieTitle[i];
                console.log(JSON.stringify(this.titleSubmit));
            }
        }
        
    }


    onClickSubmitTitle(event){
        console.log('Time to submit the title!');
        
        const title = this.titleSubmit;
        const stock = this.stockNumber.toString();

        console.log('The title being submit: ', JSON.stringify( title ) );

        const titleSubmitEvent = new CustomEvent(
            "submittitle",
            {
                detail: 
                {
                    "title": title,
                    "stock": stock
                }
            }
        );

        // Clear the variables!
        this.movieTitle = '';
        this.titleSubmit = '';
        this.stock = '';
        this.show = false;
        this.template.querySelector('lightning-input[data-name="titleSearch"]').value = '';
        this.template.querySelector('lightning-input[data-name="stockAmount"]').value = '';

        this.dispatchEvent(titleSubmitEvent);
    }


    onClickRetrieveTitles(event){
        console.log("Retrieve request recieved!");

        this.titleSearchValue   = this.template.querySelector('lightning-input[data-name="titleSearch"]').value;
        this.stockNumber        = this.template.querySelector('lightning-input[data-name="stockAmount"]').value;
        this.show               = true;

        const titleName = this.titleSearchValue;

        console.log("Values entered:");
        console.log("Title search value: ",     titleName);
        console.log("Stock amount value: ",     this.stockNumber);

        const valueChangeEvent = new CustomEvent(
            "valuechange",
            {
                detail: {"title": titleName}
            }
        );

        this.dispatchEvent(valueChangeEvent);
    }

}