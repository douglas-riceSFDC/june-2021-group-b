({
	searchForAccounts : function(cmp, evt, hlpr) {
        
        var searchVal = cmp.get("v.searchVal");
        var fieldName = cmp.get("v.filterSelection");
        var action = cmp.get("c.getTitleList");
        var urlString = window.location.href;
        var baseURL = urlString.substring(0, urlString.indexOf("/s"));
        
        action.setParams({fieldName :fieldName , searchVal :searchVal});
        action.setCallback(this, function(response){
            var state = response.getState();
        	if(state==="SUCCESS"){
                
                var accountList = response.getReturnValue();
                cmp.set("v.accountSearchResults", accountList);
                var finalURL = baseURL+'/s/title-detail-page?title=';
                cmp.set("v.cbaseURL", finalURL);
            }
        	else if(state==="ERROR"){
                         var errors = response.getError();
                          if(errors){
                            if(errors[0]&&errors[0].message){
                               console.log("Error message: "+
                                           errors[0].message);
                                }
                            } else {
                                console.log("Unknown error");
                            }
                        }
        })
        $A.enqueueAction(action);
	}
})