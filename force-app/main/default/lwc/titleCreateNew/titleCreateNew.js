import { LightningElement, track, api } from 'lwc';

export default class titleCreateNew extends LightningElement {
    @track titleSearchValue;
    @track stockNumber;
    @track _movieTitle;

    @api
    get movietitle(){
        return this._movieTitle;
    }
    set movieTitle(value){
        this.setAttribute('movieTitle', value);
        this._movieTitle = value;
        this.setup();
    }

    setup(){
        console.log("Movie title reassigned.");
        console.log(this._movieTitle);
    }

    onClickRetrieveTitles(event){
        this.titleSearchValue   = this.template.querySelector('lightning-input[data-name="titleSearch"]').value;
        this.stockNumber        = this.template.querySelector('lightning-input[data-name="stockAmount"]').value;

        const titleName = this.titleSearchValue;

        console.log("Values entered:");
        console.log("Title search value: ",     titleName);
        console.log("Stock amount value: ",     this.stockNumber);
        console.log("movieTitle value: ",       this.movieTitle);

        const valueChangeEvent = new CustomEvent(
            "valuechange",
            {
                detail: {"title": titleName}
            }
        );

        this.dispatchEvent(valueChangeEvent);
    }

}