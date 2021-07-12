public with sharing class RecommendedMovies {
    
    @AuraEnabled
    public static List<Title__c> getRecommendedTitles(){
        /**
         * Retreive movies to be diplayed in the recommneded movies lightning web component
         * Recommneded movies should share a genre with another movie the user has rented
         */
        List<Title__c> recommendedMoviesList = new List<Title__c>();
        List<Rental__c> userRentals = [SELECT Stock__r.Title__r.Genre__c
                                       FROM Rental__c
                                       WHERE Customer__c =: UserInfo.getUserId()];
        List<Title__c> allTitles = [SELECT Name, Genre__c, Poster__c
                                    FROM Title__c];

        Set<String> myGenres = new Set<String>();
        for (Rental__c myRental : userRentals) {
            myGenres.addAll(myRental.Stock__r.Title__r.Genre__c.split(';'));
            
        }

        for (Title__c t : allTitles) {
            if (t.Genre__c != null ) {
                String[] genres = t.Genre__c.split(';');

                boolean hasGenre = false;
                for (String genre : genres) {
                    if (myGenres.contains(genre)) {
                        hasGenre = true;
                    }
                }
                if (hasGenre) {
                    recommendedMoviesList.add(t);
                }
            }
        }

        return recommendedMoviesList;
    }
}