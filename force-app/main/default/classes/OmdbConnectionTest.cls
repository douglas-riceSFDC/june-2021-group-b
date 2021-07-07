@isTest
private class OmdbConnectionTest {
    // TODO ADD SYSTEM ASSERTS

    // HttpResponse res; 

    /*
    @isTest
    static void generateGetMovieListFromTitle_GivenTitleWithNoSpaces_shouldGenerateMovieList(){
        OmdbConnection omdbc = new OmdbConnection();

        Test.startTest();

        List<OmdbWrapperClass> movies = omdbc.getMovieListFromTitle('Harry');

        Test.stopTest();

        System.assert(movies.size() > 0);

    }

    @isTest
    static void generateGetMovieListFromTitle_GivenTitleWithSymbolsAndSpaces_shouldGenerateMovieList(){
        OmdbConnection omdbc = new OmdbConnection();

        Test.startTest();

        List<OmdbWrapperClass> movies = omdbc.getMovieListFromTitle('#Harry &Potter');

        Test.stopTest();

        System.assert(movies.size() > 0);

    }

    @isTest
    static void generateGetMovieListFromTitle_GivenTitleWithNumbers_shouldGenerateMovieList(){
        OmdbConnection omdbc = new OmdbConnection();

        Test.startTest();

        List<OmdbWrapperClass> movies = omdbc.getMovieListFromTitle('13');

        Test.stopTest();

        System.assert(movies.size() > 0);
    }
    

    @isTest
    static void generateGetMovieListFromTitle_GivenTitleWithGibberish_shouldGenerateNoMovieList(){
        OmdbConnection omdbc = new OmdbConnection();

        Test.startTest();

        List<OmdbWrapperClass> movies = omdbc.getMovieListFromTitle('adsoigjaposdhga');

        Test.stopTest();

        System.assertEquals(0, movies.size());
    }*/

    @isTest
    static void generateGetMovieListFromTitle_GivenNullTitle_shouldNotGenerateMovieList(){
        OmdbConnection omdbc = new OmdbConnection();

        Test.startTest();

        String title;
        List<OmdbWrapperClass> movies = omdbc.getMovieListFromTitle(title);

        Test.stopTest();

        System.assertEquals(null, movies);
    }

    @isTest
    static void generateCleanseTitleString_GivenStringWithOnlyChar_shouldGenerateUnchangedString(){
        OmdbConnection omdbc = new OmdbConnection();

        Test.startTest();

        String title = 'Harry';
        String result = omdbc.cleanseTitleString(title);

        Test.stopTest();

        System.assertEquals('Harry', result);
    }

    @isTest
    static void generateCleanseTitleString_GivenStringWithSpacesAndSymbols_shouldGenerateStringWithSpaceReplacementAndNoSymbols(){
        OmdbConnection omdbc = new OmdbConnection();

        Test.startTest();

        String title = '#Harry** Potter';
        String resultString = omdbc.cleanseTitleString(title);

        Test.stopTest();

        Boolean result = false;
        Pattern symbolPattern = Pattern.compile('^[a-zA-Z0-9%]');
        Matcher symbolMatcher = symbolPattern.matcher(resultString.trim());

        if(symbolMatcher.matches()){
            result = true;
        }

        System.assertEquals(false, result);
    }

    /*
    @isTest
    static void generateParseOmdbJsonFromHttpResponse_givenNormalHttpRequest_shouldGenerateMoviesList(){
        OmdbConnection omdbc = new OmdbConnection();
        HttpResponse res = omdbc.getOmdbResponse('Harry');

        Test.startTest();

        List<OmdbWrapperClass> movies = omdbc.parseOmdbJsonFromHttpResponse(res);

        Test.stopTest();

        System.assert(movies.size() > 0);

    }*/
}
