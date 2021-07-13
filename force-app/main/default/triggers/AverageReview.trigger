trigger AverageReview on Movie_Review__c (after insert) {
    Set<Title__c> titlesToUpdate = new Set<Title__c>();

//SELECT Name, Average_Rating__c
                          //FROM Title__c
                         // WHERE Id =: trigger.newmap.keyset()
    for (Movie_Review__c review : Trigger.new) {
        system.debug(review.Title__c);
        List<Title__c> title = [SELECT Name, Average_Rating__c
                          FROM Title__c
                          WHERE Id = :review.Title__c];
        ReviewCalculator calculator = new ReviewCalculator();
        title[0].Average_Rating__c = calculator.updateMovieReview(review.Rating__c, review.Title__c);
        titlesToUpdate.remove(title[0]);
        titlesToUpdate.add(title[0]);
    }
    List<Title__c> titlesList = new List<Title__c>();
    for (Title__c title : titlesToUpdate) {
        titlesList.add(title);
    }
    update(titlesList);

}