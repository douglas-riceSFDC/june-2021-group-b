public with sharing class RecommendedMovies {
    
    @AuraEnabled
    public static List<Title__c> getRecommendedTitles(Integer lim){
        /**
         * Retreive movies to be diplayed in the recommneded movies lightning web component
         * Recommneded movies should share a genre with another movie the user has rented
         */
        List<Title__c> recommendedMoviesList = new List<Title__c>();
        List<Rental__c> userRentals = [SELECT Stock__r.Title__r.Genre__c, Stock__r.Title__c
                                       FROM Rental__c
                                       WHERE Customer__c =: UserInfo.getUserId()];
        List<Title__c> allTitles = [SELECT Name, Id, Genre__c, Poster__c, Average_Rating__c
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
                if (hasGenre && recommendedMoviesList.size() < lim) {
                    recommendedMoviesList.add(t);
                }
            }
        }
        return removeRentedTitles(recommendedMoviesList, userRentals);
    }

    /**
     * Helper Method that removes all currently rented titles and filters by a rating of greater
     * than 80%.
     */
    private static List<Title__c> removeRentedTitles(List<Title__c> recommendedMoviesList, List<Rental__c> userRentals) {
        List<Title__c> titlesToRemove = new List<Title__c>();
        List<Title__c> finalList = new List<Title__c>();
        for (Rental__c rental : userRentals) {
            Title__c title = [SELECT Name, Id, Genre__c, Poster__c, Average_Rating__c
                              FROM Title__c
                              WHERE Id = :rental.Stock__r.Title__c][0];
            titlesToRemove.add(title);
        }

        system.debug(titlesToRemove);

        for (Title__c t : recommendedMoviesList) {
            if ( !titlesToRemove.contains(t) && t.Average_Rating__c > 80) {
                finalList.add(t);
            }
        }

        return finalList;
    }
}