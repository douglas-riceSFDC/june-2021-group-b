public with sharing class ReviewCalculator {
    public ReviewCalculator() {

    }

    public Double updateMovieReview(Decimal rating, String movieID) {
        Double average = 0;
        Integer numReviews = 0;
        List<Movie_Review__c> reviews = [SELECT Rating__c, Title__c
                                         FROM Movie_Review__c
                                         WHERE Title__c = :movieID];

        for (Movie_Review__c review : reviews) {
            average += review.Rating__c;
            numReviews++;
        }

        return average / numReviews;
    }
}
