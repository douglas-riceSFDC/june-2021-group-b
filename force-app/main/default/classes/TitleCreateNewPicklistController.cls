public with sharing class TitleCreateNewPicklistController {
    

    @AuraEnabled
    public static String getMovieTitles(String selectedField){

        OmdbConnection omdbConnection = new OmdbConnection();

        String movies = omdbConnection.getMovieListFromTitle(selectedField);

        System.debug('Here are the titles: ' + movies);

        return movies;
    }


    @AuraEnabled
    public static Boolean createNewTitle(String titleObject){
        OmdbConnection omdbConnection = new OmdbConnection();
        Map<String, Object> selectedTitle = (Map<String, Object>) JSON.deserializeUntyped(titleObject);

        String imdbId = selectedTitle.get('imdbID').toString();
        System.debug('imdbId: ' + imdbId);
        
        List<Title__c> titleInDatabase =  [
                                        SELECT Name
                                        FROM Title__c
                                        WHERE ImdbID__c =: imdbId
                                    ];

        // If the title retrieved from the database is null, then the title does not already exist.
        //      -> We then can add a new title.
        //      -> By skipping this add, but not exiting, the stock will still be added to our database.
        if(titleInDatabase.isEmpty()){
            String fullTitleInfo = omdbConnection.getMovieFromId(imdbId);
            System.debug('Full title info: ' + fullTitleInfo);

            Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(fullTitleInfo);

            Title__c newTitle = omdbConnection.getTitleFromJsonMap(jsonMap);

            insert newTitle;
        }

        return true;
    }


    @AuraEnabled
    public static Boolean createStockForNewTitle(String titleObject, Integer stock){
        OmdbConnection omdbConnection = new OmdbConnection();
        Map<String, Object> selectedTitle = (Map<String, Object>) JSON.deserializeUntyped(titleObject);

        String title = selectedTitle.get('Title').toString();
        System.debug('Title: ' + title);

        Title__c databaseTitle =    [
                                SELECT Id, Poster__c
                                FROM Title__c
                                WHERE Name=:title
                            ];

        List<Stock__c> generatedStock = new List<Stock__c>();

        for(Integer i = 0; i < stock; i++){
            Stock__c s = new Stock__c();
            s.Title__c      = databaseTitle.Id;
            s.Poster__c     = databaseTitle.Poster__c;
            s.Status__c     = 'Available';
            generatedStock.add(s);
        }
        
        insert generatedStock;

        return true;
    }

}
