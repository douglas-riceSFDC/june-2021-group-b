@isTest
private class RentalControllerTest {
  static testMethod void getUserRentalsPositiveTestwithResults() {
    Date d = System.today().addDays(7);
    Profile p = [SELECT Id FROM Profile WHERE Name = 'Standard User'];
    User u = new User(
      Alias = 'standt',
      Email = 'standarduser@testorg.com',
      EmailEncodingKey = 'UTF-8',
      LastName = 'Testing',
      LanguageLocaleKey = 'en_US',
      LocaleSidKey = 'en_US',
      ProfileId = p.Id,
      TimeZoneSidKey = 'America/New_York',
      UserName = 'standarduser@testorg.com.june21'
    );
    insert u;
    Title__c titleRec = new Title__c(Name = 'Test movie', OwnerId = u.Id);
    insert titleRec;
    Stock__c stockRec = new Stock__c(
      Status__c = 'Available',
      Title__c = titleRec.Id
    );
    insert stockRec;
    List<Stock__c> s = [
      SELECT ID
      FROM STOCK__c
      WHERE status__c = 'Available'
      LIMIT 1
    ];
    System.assertNotEquals(null, s);
    Rental__c r = new Rental__c(
      Stock__c = s.get(0).Id,
      Due_Date__c = d,
      Customer__c = u.Id
    );
    insert r;
    Rental__c rental = [SELECT ID FROM Rental__c WHERE ID = :r.Id];
    System.assertNotEquals(null, rental);
    //assign rental to user
    List<RentalWrapper> userRentalList = RentalController.getUserRentals();
    System.assertNotEquals(null, userRentalList.size());
  }

  static testMethod void getUserRentalsPositiveTestNoResults() {
    Profile p = [SELECT Id FROM Profile WHERE Name = 'Standard User'];
    User u = new User(
      Alias = 'standt',
      Email = 'standarduser@testorg.com',
      EmailEncodingKey = 'UTF-8',
      LastName = 'Testing',
      LanguageLocaleKey = 'en_US',
      LocaleSidKey = 'en_US',
      ProfileId = p.Id,
      TimeZoneSidKey = 'America/New_York',
      UserName = 'standarduser@testorg.com.june21'
    );
    insert u;

    List<RentalWrapper> userRentalList = RentalController.getUserRentals();
    System.assertEquals(0, userRentalList.size());
  }
}
