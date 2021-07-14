public with sharing class StockController {
  @AuraEnabled
  public static void rentStock(Stock__c stock) {
    if (stock.Status__c == 'Available') {
      stock.Status__c = 'Rented';
    } else {
      system.debug('Error - Incorrect Status');
    }

    update stock;
  }
}
