public class RentalController {
    
    @AuraEnabled
    public static List<RentalWrapper> getUserCurrentRentals(){
        
        List<RentalWrapper> overDueRentalList = new List<RentalWrapper>();
        List<Rental__c> userRentals = [Select Id, Name, Due_Date__c, Stock__r.Title_Name__c, Stock__r.Poster__c FROM Rental__c WHERE Customer__c =: UserInfo.getUserId() AND Returned__c = False];
        
        for( Rental__c r : userRentals){
            system.debug(r);
            overDueRentalList.add(new RentalWrapper(r));
        }

        system.debug(overDueRentalList);
        return overDueRentalList;
    }
    @AuraEnabled
    public static List<Rental__c> getAllUserRentals (){
        List<Rental__c> AllUserRentals = [Select Id, Name, Date_Returned__c, Date_Rented__c, Title_Name__c,Stock__r.Title_Name__c, Stock__c, Stock__r.Title__c FROM Rental__c WHERE Customer__c =: UserInfo.getUserId()];
        
        return AllUserRentals;
    }
    @AuraEnabled
    public static List<Movie_Review__c> getAllUserReviews(){
        List<Movie_Review__c> AllUserReviews = [SELECT ID,Name,Reviewer_Name__c, Rating__c, Review__c,Title__c FROM Movie_Review__c WHERE Reviewer__c =: UserInfo.getUserId()];
        
        System.debug('AllUserReviews data : '+AllUserReviews);
        return AllUserReviews;
    }
}


//System.debug(RentalController.getUserRentals(UserInfo.GETUSERID()));