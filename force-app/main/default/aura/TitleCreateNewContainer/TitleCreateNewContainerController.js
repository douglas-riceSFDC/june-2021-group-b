({
    

    getValueFromLwc : function(component, event, helper){

        console.log("Event received!");
        console.log("In the TitleCreateNewContainer.js :")
        var titleName = event.getParam('title');

        console.log(event);
        console.log(titleName);
        
        helper.getPickListValues(component, "c.getMovieTitles", titleName);
    },


    setTitle : function(component, event, helper){

        console.log("Event received!");

        var title = event.getParam('title');
        var stock = event.getParam('stock');

        console.log("Title: ", JSON.stringify(title));
        console.log("Stock: ", stock);

        helper.createNewTitle(component, "c.createNewTitle", title);
        helper.createNewTitleStock(component, "c.createStockForNewTitle", title, stock);

        var homeEvt = $A.get("e.force:navigateToObjectHome");
        homeEvt.setParams({
            "scope": "Title__c"
        });

        homeEvt.fire();
    },


    cancelDialog : function(component, helper){

        var homeEvt = $A.get("e.force:navigateToObjectHome");
        homeEvt.setParams({
            "scope": "Title__c"
        });

        homeEvt.fire();
    }


})
