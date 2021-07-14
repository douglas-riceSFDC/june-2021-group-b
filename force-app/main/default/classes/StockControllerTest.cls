@isTest
private class StockControllerTest {
  @TestSetup
  static void setupStockData() {
    Title__c testTitle = TestDataFactory.createTitle('Test Movie', 'Action');
    insert testTitle;

    Stock__c testStock = TestDataFactory.createStock(testTitle.Id, 'Available');
    insert testStock;

    Stock__c testStock2 = TestDataFactory.createStock(testTitle.Id, 'Rented');
    insert testStock2;

    Stock__c testStock3 = TestDataFactory.createStock(testTitle.Id, 'Damaged');
    insert testStock3;
  }

  @isTest
  static void rentStock_givenAnAvailableStock_shouldChangeStatusToRented() {
    List<Stock__c> testStock = [SELECT Status__c FROM Stock__c];
    List<Stock__c> stockToUpdate = new List<Stock__c>();

    StockController.rentStock(testStock[0]);

    testStock = [SELECT Status__c FROM Stock__c];
    System.assertEquals(
      'Rented',
      testStock[0].Status__c,
      'Stock Status Should be rented'
    );
  }

  @isTest
  static void rentStock_givenARentedStock_statusShouldRemainRented() {
    List<Stock__c> testStock = [SELECT Status__c FROM Stock__c];
    List<Stock__c> stockToUpdate = new List<Stock__c>();

    StockController.rentStock(testStock[1]);

    testStock = [SELECT Status__c FROM Stock__c];
    System.assertEquals(
      'Rented',
      testStock[1].Status__c,
      'Stock Status Should be rented + Should go through error loop'
    );
  }

  @isTest
  static void rentStock_givenADamagedStock_shouldNotChangeStatusToRented() {
    List<Stock__c> testStock = [SELECT Status__c FROM Stock__c];
    List<Stock__c> stockToUpdate = new List<Stock__c>();

    StockController.rentStock(testStock[2]);

    testStock = [SELECT Status__c FROM Stock__c];
    System.assertEquals(
      'Damaged',
      testStock[2].Status__c,
      'Should Remain Damaged'
    );
  }
}
