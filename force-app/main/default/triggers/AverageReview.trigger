trigger AverageReview on Movie_Review__c(after insert) {
  List<Title__c> titlesToUpdate = new List<Title__c>();

  for (Movie_Review__c review : Trigger.new) {
    system.debug(review.Title__c);
    List<Title__c> title = [
      SELECT Name, Average_Rating__c
      FROM Title__c
      WHERE Id = :review.Title__c
    ];
    ReviewCalculator calculator = new ReviewCalculator();
    title[0].Average_Rating__c = calculator.updateMovieReview(
      review.Rating__c,
      review.Title__c
    );
    titlesToUpdate.add(title[0]);
  }
  update (titlesToUpdate);

}
