({
    getPickListValues : function(component, actionName, titleName) {  
        console.log("In the helper: ")

        var responseValue;
        var action = component.get(actionName);

        console.log("The action is: ",   actionName);
        console.log("The val is : ",     titleName);

        action.setParams({ v: titleName });

        action.setCallback(this, function(response){
            var state = response.getState();

            if (state === "SUCCESS"){
                this.responseValue = response.toString();
                console.log(response.toString());
                component.set("movieTitle", this.responseValue);
                v.movieTitle.set("Yurp");
                //component.get("v.movieTitles") = this.responseValue;
            }

        });

        $A.enqueueAction(action);

    }
})
