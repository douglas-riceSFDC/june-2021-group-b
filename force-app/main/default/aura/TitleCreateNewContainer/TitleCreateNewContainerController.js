({

    getValueFromLwc : function(component, event, helper){
        //component.set("v.inputValue", event.getParam('titleName'));
        console.log("Event received!");
        console.log("In the TitleCreateNewContainer.js :")
        var titleName = event.getParam('title');

        console.log(event);
        console.log(titleName);
        
        helper.getPickListValues(component, "c.getMovieTitles", titleName);
    
    }
})
