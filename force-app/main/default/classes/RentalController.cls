public class RentalController {
  //Build query string then use database.query
  @AuraEnabled
  public static List<RentalWrapper> getUserCurrentRentals() {
    List<RentalWrapper> overDueRentalList = new List<RentalWrapper>();
    List<Rental__c> userRentals = [
      SELECT Id, Name, Due_Date__c, Stock__r.Title_Name__c, Stock__r.Poster__c
      FROM Rental__c
      WHERE Customer__c = :UserInfo.getUserId() AND Returned__c = FALSE
    ];

    for (Rental__c r : userRentals) {
      overDueRentalList.add(new RentalWrapper(r));
    }
    return overDueRentalList;
  }

  @AuraEnabled
  public static List<Rental__c> getAllUserRentals() {
    List<Rental__c> allUserRentals = [
      SELECT
        Id,
        Name,
        Date_Returned__c,
        Date_Rented__c,
        Title_Name__c,
        Stock__r.Title_Name__c,
        Stock__c,
        Stock__r.Title__c
      FROM Rental__c
      WHERE Customer__c = :UserInfo.getUserId()
    ];

    return allUserRentals;
  }

  @AuraEnabled
  public static List<Movie_Review__c> getAllUserReviews() {
    List<Movie_Review__c> allUserReviews = [
      SELECT
        ID,
        Name,
        Reviewer_Name__c,
        CreatedDate,
        Rating__c,
        Review__c,
        Title__c,
        Title__r.Name
      FROM Movie_Review__c
      WHERE Reviewer__c = :UserInfo.getUserId()
    ];
    return allUserReviews;
  }
}

//System.debug(RentalController.getAllUserReviews());

