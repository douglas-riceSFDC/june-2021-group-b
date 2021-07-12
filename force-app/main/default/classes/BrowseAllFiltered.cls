public with sharing class BrowseAllFiltered {

    @AuraEnabled
    public static List<Title__c> getFilteredTitles(String genre, String orderBy) {
        List<Title__c> filteredTitles = new List<Title__c>();
        List<Title__c> allTitles = new List<Title__c>();

        if (orderBy == 'Release Date') {
            allTitles = [SELECT Name, Genre__c, Poster__c
                        FROM Title__c
                        ORDER BY Release_Date__c DESC];
        } else {
            allTitles = [SELECT Name, Genre__c, Poster__c
                         FROM TITLE__c
                         ORDER BY Average_Rating__c DESC];
        }

        for (Title__c t : allTitles) {
            if (t.Genre__c != null) {
                String[] genres = t.Genre__c.split(';');

                for (String s : genres) {
                    if (s == genre) {
                        filteredTitles.add(t);
                    }
                }
            }
        }
        system.debug(filteredTitles);
        return filteredTitles;
    }

    @AuraEnabled
    public static void getTitles() {

    }
}