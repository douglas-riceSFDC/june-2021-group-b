public with sharing class TitleAuraService {
  @AuraEnabled
  public static List<Title__c> getLatestTitles(Integer limiter) {
    return [
      SELECT
        Name,
        Genre__c,
        Poster__c,
        Available_Stock__c,
        Total_Stock__c,
        Runtime__c,
        Notable_Actors__c,
        Director__c,
        Writer__c,
        Plot_Description__c,
        Release_Date__c
      FROM Title__c
      ORDER BY CreatedDate DESC
      LIMIT :limiter
    ];
  }

  @AuraEnabled
  public static List<Title__c> getOutOfStockTitles() {
    return [
      SELECT
        Name,
        Genre__c,
        Poster__c,
        Available_Stock__c,
        Total_Stock__c,
        Runtime__c,
        Notable_Actors__c,
        Director__c,
        Writer__c,
        Plot_Description__c,
        Release_Date__c
      FROM Title__c
      WHERE Available_Stock__c = 0
      ORDER BY CreatedDate DESC
    ];
  }

  @AuraEnabled
  public static List<Title__c> getNewAndFeaturedTitles() {
    return [
      SELECT Poster__c
      FROM Title__c
      WHERE CreatedDate > :Date.today().addDays(-7)
    ];
  }
}
