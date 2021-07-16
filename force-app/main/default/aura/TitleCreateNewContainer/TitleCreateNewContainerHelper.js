({


    getPickListValues : function(component, actionName, titleName) {  
        console.log("In the helper: ")

        var action = component.get(actionName);

        console.log("The action is: ",   actionName);
        console.log("The val is : ",     titleName);

        action.setParams({ selectedField: titleName });

        action.setCallback(this, function(response){
            var state = response.getState();

            if (state === "SUCCESS"){
                console.log('Helper response:');
                console.log('Response object: ', response);
                console.log('As string: ', response.toString());

                var r = JSON.parse(response.getReturnValue());
        
                console.log("The titles are: ");
                for ( var i in r["Search"]){
                    if (r["Search"].hasOwnProperty(i)){
                        console.log("Movie #" + i + ": ");
                        for( var key in r["Search"][i]){
                            if (r["Search"][i].hasOwnProperty(key)){
                                console.log(key + ": " + r["Search"][i][key]);
                            }
                        }
                    }
                    console.log('');
                }
                
                component.set("v.movieTitles", r["Search"]);
            }
            else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + errors[0].message);
                    }
                } else {
                    console.log("Unknown error.");
                }
            }

        });

        $A.enqueueAction(action);

    },


    createNewTitle : function(component, actionName, title){
        console.log("Creating new title... ");

        var action = component.get(actionName);
        var titleAsAString = JSON.stringify(title);

        console.log("The action is: ",   actionName);
        console.log("The val is : ",     titleAsAString);

        action.setParams({ titleObject: titleAsAString });

        action.setCallback(this, function(response){
            var state = response.getState();

            if (state === "SUCCESS"){
                console.log("Title created!");
            }
            else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
            }
        });

        $A.enqueueAction(action);

    },
    

    createNewTitleStock : function(component, actionName, title, stock){
        console.log("Creating stock for the new title... ");

        var action = component.get(actionName);
        const titleAsAString = JSON.stringify(title);

        console.log("The action is: ",   actionName);
        console.log("The title is : ",   titleAsAString);
        console.log("The stock is:",     stock);

        action.setParams(
            {
                titleObject:    titleAsAString,
                stock:          stock
            }
        );

        action.setCallback(this, function(response){
            var state = response.getState();

            if (state === "SUCCESS"){
                console.log("Stock created!");
            }
            else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
            }
        });
        
        $A.enqueueAction(action);

    }


})
