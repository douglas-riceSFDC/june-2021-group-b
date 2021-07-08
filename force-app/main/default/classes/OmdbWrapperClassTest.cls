@isTest
private class OmdbWrapperClassTest {

    @isTest
    static void generateGetAndSetTitle_givenNullTitle_shouldAssignTitle(){
        OmdbWrapperClass movie = new OmdbWrapperClass();
        String newTitle = 'Hello';

        Test.startTest();
        movie.setTitle(newTitle);
        Test.stopTest();

        System.assertEquals(newTitle, movie.getTitle());
    }

    @isTest
    static void generateGetAndSetTitle_givenAssignedTitle_shouldAssignTitle(){
        OmdbWrapperClass movie = new OmdbWrapperClass('World', '2012', 'idoag', 'movie', 'https://website.com/');
        String newTitle = 'Hello';

        Test.startTest();
        movie.setTitle(newTitle);
        Test.stopTest();

        System.assertEquals(newTitle, movie.getTitle());
    }

    
    @isTest
    static void generateGetAndSetYear_givenNullYear_shouldAssignYear(){
        OmdbWrapperClass movie = new OmdbWrapperClass();
        String newYear = '2011';

        Test.startTest();
        movie.setYear(newYear);
        Test.stopTest();

        System.assertEquals(newYear, movie.getYear());
    }

    @isTest
    static void generateGetAndSetYear_givenAssignedYear_shouldAssignYear(){
        OmdbWrapperClass movie = new OmdbWrapperClass('World', '2012', 'idoag', 'movie', 'https://website.com/');
        String newYear = '2011';

        Test.startTest();
        movie.setYear(newYear);
        Test.stopTest();

        System.assertEquals(newYear, movie.getYear());
    }

        
    @isTest
    static void generateGetAndSetImbdId_givenNullImdbId_shouldAssignImdbId(){
        OmdbWrapperClass movie = new OmdbWrapperClass();
        String newImdbId = '777';

        Test.startTest();
        movie.setImbdId(newImdbId);
        Test.stopTest();

        System.assertEquals(newImdbId, movie.getImdbId());
    }

    @isTest
    static void generateGetAndSetImbdId_givenAssignedImbdId_shouldAssignImbdId(){
        OmdbWrapperClass movie = new OmdbWrapperClass('World', '2012', 'idoag', 'movie', 'https://website.com/');
        String newImdbId = '777';

        Test.startTest();
        movie.setImbdId(newImdbId);
        Test.stopTest();

        System.assertEquals(newImdbId, movie.getImdbId());
    }
        
    @isTest
    static void generateGetAndSetType_givenNullType_shouldAssignType(){
        OmdbWrapperClass movie = new OmdbWrapperClass();
        String newType = 'show';

        Test.startTest();
        movie.setType(newType);
        Test.stopTest();

        System.assertEquals(newType, movie.getType());
    }

    @isTest
    static void generateGetAndSetType_givenAssignedType_shouldAssignType(){
        OmdbWrapperClass movie = new OmdbWrapperClass('World', '2012', 'idoag', 'movie', 'https://website.com/');
        String newType = 'show';

        Test.startTest();
        movie.setType(newType);
        Test.stopTest();

        System.assertEquals(newType, movie.getType());
    }

    @isTest
    static void generateGetAndSetPosterUrl_givenNullPosterUrl_shouldAssignPosterUrl(){
        OmdbWrapperClass movie = new OmdbWrapperClass();
        String newPosterUrl = 'https://www.moviepic.photo';

        Test.startTest();
        movie.setPosterUrl(newPosterUrl);
        Test.stopTest();

        System.assertEquals(newPosterUrl, movie.getPosterUrl());
    }

    @isTest
    static void generateGetAndSetPosterUrl_givenAssignedPosterUrl_shouldAssignPosterUrl(){
        OmdbWrapperClass movie = new OmdbWrapperClass('World', '2012', 'idoag', 'movie', 'https://website.com/');
        String newPosterUrl = 'https://www.moviepic.photo';

        Test.startTest();
        movie.setPosterUrl(newPosterUrl);
        Test.stopTest();

        System.assertEquals(newPosterUrl, movie.getPosterUrl());

    }

}
