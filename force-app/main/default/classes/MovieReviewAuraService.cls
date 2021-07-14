public with sharing class MovieReviewAuraService {
  @AuraEnabled
  public static List<Movie_Review__c> getRecentReviewsByTitle(
    Integer limiter,
    Id title
  ) {
    return [
      SELECT
        Rating__c,
        Review__c,
        Reviewer__r.Name,
        Reviewer__r.IsProfilePhotoActive,
        Reviewer__r.MediumPhotoUrl,
        CreatedDate,
        Title__r.Name
      FROM Movie_Review__c
      WHERE Title__c = :title
      ORDER BY CreatedDate DESC
      LIMIT :limiter
    ];
  }
}
