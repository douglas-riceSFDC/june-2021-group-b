public class RentalController {
    
    @AuraEnabled
    public static List<RentalWrapper> getUserRentals(){
        /*Create a new Lightning Web Component called rentedTitlesList
         * Display the Due Date, Title, and Poster of each title the current User currently has an open Rental for
         * The Due Date should be Red when Overdue.
        */
        List<RentalWrapper> overDueRentalList = new List<RentalWrapper>();
        List<Rental__c> userRentals = [Select Id, Name, Due_Date__c, Stock__r.Title_Name__c, Stock__r.Poster__c FROM Rental__c WHERE Customer__c =: UserInfo.getUserId()];
        
        for( Rental__c r : userRentals){
            system.debug(r);
            overDueRentalList.add(new RentalWrapper(r));
        }

        system.debug(overDueRentalList);
        return overDueRentalList;
    }
}


//System.debug(RentalController.getUserRentals(UserInfo.GETUSERID()));