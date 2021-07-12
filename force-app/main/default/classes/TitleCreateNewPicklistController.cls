public with sharing class TitleCreateNewPicklistController {
    @AuraEnabled
    public static String getMovieTitles(String selectedField){
        //String movieTitles = new List<String>();

        OmdbConnection omdbConnection = new OmdbConnection();
        String movies = omdbConnection.getMovieListFromTitle(selectedField);

        System.debug('Here are the titles: ' + movies);

        return movies;
    }

}
