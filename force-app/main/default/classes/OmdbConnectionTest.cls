@isTest
private class OmdbConnectionTest {
    // TODO ADD SYSTEM ASSERTS

    // HttpResponse res; 

    /*
    @isTest
    static void generateGetMovieListFromTitle_GivenTitleWithNoSpaces_shouldGenerateMovieList(){
        OmdbConnection omdbc = new OmdbConnection();
        
        // Set mock callout class    
        Test.setMock(HttpCalloutMock.class, new OmdbConnectionTestMockImpl());

        Test.startTest();

        List<OmdbWrapperClass> movies = omdbc.getMovieListFromTitle('Harry');

        Test.stopTest();

        System.assert(movies.size() > 0);

    }*/

    @isTest
    static void generateGetMovieListFromTitle_GivenTitleWithSymbolsAndSpaces_shouldGenerateMovieList(){
        OmdbConnection omdbc = new OmdbConnection();

        // Set mock callout class    
        Test.setMock(HttpCalloutMock.class, new OmdbConnectionTestMockImpl());

        Test.startTest();

        List<OmdbWrapperClass> movies = omdbc.getMovieListFromTitle('#Harry &Potter');

        Test.stopTest();

        System.assert(movies.size() > 0);

    }

    /*
    @isTest
    static void generateGetMovieListFromTitle_GivenTitleWithNumbers_shouldGenerateMovieList(){
        // Set mock callout class    
        Test.setMock(HttpCalloutMock.class, new OmdbConnectionTestMockImpl());

        OmdbConnection omdbc = new OmdbConnection();

        Test.startTest();

        List<OmdbWrapperClass> movies = omdbc.getMovieListFromTitle('13');

        Test.stopTest();

        System.assert(movies.size() > 0);
    }
    

    @isTest
    static void generateGetMovieListFromTitle_GivenTitleWithGibberish_shouldGenerateNoMovieList(){
        // Set mock callout class    
        Test.setMock(HttpCalloutMock.class, new OmdbConnectionTestMockImpl());

        OmdbConnection omdbc = new OmdbConnection();

        Test.startTest();

        List<OmdbWrapperClass> movies = omdbc.getMovieListFromTitle('adsoigjaposdhga');

        Test.stopTest();

        System.assertEquals(0, movies.size());
    }*/

    @isTest static void testCallout() {
        // (?) TODO:    -> Reference from encrypted .txt file (?)
        //              -> Or label?
        String omdbKey = '4339b121';
        String omdbURLBase = 'http://www.omdbapi.com/';
        String omdbSearchString = '?s=%27' + 'Harry%20Potter' + '%27&apikey=' + omdbKey;
        String omdbURL = omdbURLBase + omdbSearchString;

        // Set mock callout class    
        Test.setMock(HttpCalloutMock.class, new OmdbConnectionTestMockImpl());
        
        // Call method to test.
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        HttpRequest req = new HttpRequest();
        req.setEndpoint(omdbURL);
        req.setMethod('GET');
        Http h = new Http();
        HttpResponse res = h.send(req);

        /*
        //ProcessHandlerShowAccounts.webServiceCallOut('0011300001schfFAAQ','create');
        AccountIntegration.AccountParameter testAccount = new AccountIntegration.AccountParameter();
        testAccount.accountId = '0011300001schfFAAQ';
        testAccount.action= 'create';
        
        LIST<AccountIntegration.AccountParameter> testActLst = new LIST<AccountIntegration.AccountParameter>();
        testActLst.add(testAccount);
        AccountIntegration.handleNewAccounts(testActLst);*/
        
        // Verify response received contains fake values
        String actualValue = res.getBody();
        String expectedValue = '{"Search":[{"Title":"Harry Potter and the Deathly Hallows: Part 2","Year":"2011","imdbID":"tt1201607","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BMGVmMWNiMDktYjQ0Mi00MWIxLTk0N2UtN2ZlYTdkN2IzNDNlXkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_SX300.jpg"},{"Title":"Harry Potter and the Sorcerers Stone","Year":"2001","imdbID":"tt0241527","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BNjQ3NWNlNmQtMTE5ZS00MDdmLTlkZjUtZTBlM2UxMGFiMTU3XkEyXkFqcGdeQXVyNjUwNzk3NDc@._V1_SX300.jpg"},{"Title":"Harry Potter and the Chamber of Secrets","Year":"2002","imdbID":"tt0295297","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BMTcxODgwMDkxNV5BMl5BanBnXkFtZTYwMDk2MDg3._V1_SX300.jpg"},{"Title":"Harry Potter and the Prisoner of Azkaban","Year":"2004","imdbID":"tt0304141","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BMTY4NTIwODg0N15BMl5BanBnXkFtZTcwOTc0MjEzMw@@._V1_SX300.jpg"},{"Title":"Harry Potter and the Goblet of Fire","Year":"2005","imdbID":"tt0330373","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BMTI1NDMyMjExOF5BMl5BanBnXkFtZTcwOTc4MjQzMQ@@._V1_SX300.jpg"},{"Title":"Harry Potter and the Order of the Phoenix","Year":"2007","imdbID":"tt0373889","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BMTM0NTczMTUzOV5BMl5BanBnXkFtZTYwMzIxNTg3._V1_SX300.jpg"},{"Title":"Harry Potter and the Deathly Hallows: Part 1","Year":"2010","imdbID":"tt0926084","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BMTQ2OTE1Mjk0N15BMl5BanBnXkFtZTcwODE3MDAwNA@@._V1_SX300.jpg"},{"Title":"Harry Potter and the Half-Blood Prince","Year":"2009","imdbID":"tt0417741","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BNzU3NDg4NTAyNV5BMl5BanBnXkFtZTcwOTg2ODg1Mg@@._V1_SX300.jpg"},{"Title":"Harry Potter and the Forbidden Journey","Year":"2010","imdbID":"tt1756545","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BNDM0YzMyNGUtMTU1Yy00OTE2LWE5NzYtZDZhMTBmN2RkNjg3XkEyXkFqcGdeQXVyMzU5NjU1MDA@._V1_SX300.jpg"},{"Title":"Harry Potter and the Chamber of Secrets","Year":"2002","imdbID":"tt0304140","Type":"game","Poster":"https://m.media-amazon.com/images/M/MV5BNTM4NzQ2NjA4NV5BMl5BanBnXkFtZTgwODAwMjE4MDE@._V1_SX300.jpg"}],"totalResults":"110","Response":"True"}';


        System.assertEquals(actualValue, expectedValue);
        System.assertEquals(200, res.getStatusCode());
    }

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

    @isTest
    static void generateParseOmdbJsonFromHttpResponse_givenNormalHttpRequest_shouldGenerateMoviesList(){
        // (?) TODO:    -> Reference from encrypted .txt file (?)
        //              -> Or label?
        String omdbKey = '4339b121';
        String omdbURLBase = 'http://www.omdbapi.com/';
        String omdbSearchString = '?s=%27' + 'Harry%20Potter' + '%27&apikey=' + omdbKey;
        String omdbURL = omdbURLBase + omdbSearchString;

        // Set mock callout class    
        Test.setMock(HttpCalloutMock.class, new OmdbConnectionTestMockImpl());
        
        // Call method to test.
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        HttpRequest req = new HttpRequest();
        req.setEndpoint(omdbURL);
        req.setMethod('GET');
        Http h = new Http();
        HttpResponse res = h.send(req);
        OmdbConnection omdbc = new OmdbConnection();

        Test.startTest();

        List<OmdbWrapperClass> movies = omdbc.parseOmdbJsonFromHttpResponse(res);

        Test.stopTest();

        System.assert(movies.size() > 0);

    }

    @isTest
    static void generateOmdbWrapperClass_givenNothing_shouldGenerateEmptyWrapperClass(){
        Test.startTest();
        OmdbConnection movie = new OmdbConnection();
        Test.stopTest();

        System.assertNotEquals(null, movie);


    }
}
