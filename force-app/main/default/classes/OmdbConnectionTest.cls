@isTest
private class OmdbConnectionTest {

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
        
        // Verify response received contains fake values
        String actualValue = res.getBody();
        String expectedValue = '{"Search":[{"Title":"Harry Potter and the Deathly Hallows: Part 2","Year":"2011","imdbID":"tt1201607","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BMGVmMWNiMDktYjQ0Mi00MWIxLTk0N2UtN2ZlYTdkN2IzNDNlXkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_SX300.jpg"},{"Title":"Harry Potter and the Sorcerers Stone","Year":"2001","imdbID":"tt0241527","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BNjQ3NWNlNmQtMTE5ZS00MDdmLTlkZjUtZTBlM2UxMGFiMTU3XkEyXkFqcGdeQXVyNjUwNzk3NDc@._V1_SX300.jpg"},{"Title":"Harry Potter and the Chamber of Secrets","Year":"2002","imdbID":"tt0295297","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BMTcxODgwMDkxNV5BMl5BanBnXkFtZTYwMDk2MDg3._V1_SX300.jpg"},{"Title":"Harry Potter and the Prisoner of Azkaban","Year":"2004","imdbID":"tt0304141","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BMTY4NTIwODg0N15BMl5BanBnXkFtZTcwOTc0MjEzMw@@._V1_SX300.jpg"},{"Title":"Harry Potter and the Goblet of Fire","Year":"2005","imdbID":"tt0330373","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BMTI1NDMyMjExOF5BMl5BanBnXkFtZTcwOTc4MjQzMQ@@._V1_SX300.jpg"},{"Title":"Harry Potter and the Order of the Phoenix","Year":"2007","imdbID":"tt0373889","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BMTM0NTczMTUzOV5BMl5BanBnXkFtZTYwMzIxNTg3._V1_SX300.jpg"},{"Title":"Harry Potter and the Deathly Hallows: Part 1","Year":"2010","imdbID":"tt0926084","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BMTQ2OTE1Mjk0N15BMl5BanBnXkFtZTcwODE3MDAwNA@@._V1_SX300.jpg"},{"Title":"Harry Potter and the Half-Blood Prince","Year":"2009","imdbID":"tt0417741","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BNzU3NDg4NTAyNV5BMl5BanBnXkFtZTcwOTg2ODg1Mg@@._V1_SX300.jpg"},{"Title":"Harry Potter and the Forbidden Journey","Year":"2010","imdbID":"tt1756545","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BNDM0YzMyNGUtMTU1Yy00OTE2LWE5NzYtZDZhMTBmN2RkNjg3XkEyXkFqcGdeQXVyMzU5NjU1MDA@._V1_SX300.jpg"},{"Title":"Harry Potter and the Chamber of Secrets","Year":"2002","imdbID":"tt0304140","Type":"game","Poster":"https://m.media-amazon.com/images/M/MV5BNTM4NzQ2NjA4NV5BMl5BanBnXkFtZTgwODAwMjE4MDE@._V1_SX300.jpg"}],"totalResults":"110","Response":"True"}';

        System.assertEquals(actualValue, expectedValue);
        System.assertEquals(200, res.getStatusCode());
    }

    
    @isTest static void testSingleCallout() {
        // (?) TODO:    -> Reference from encrypted .txt file (?)
        //              -> Or label?
        String omdbKey = '4339b121';
        String omdbURLBase = 'http://www.omdbapi.com/';
        String omdbSearchString = '?i=' + 'tt0980970' + '&plot=full&apikey=' + omdbKey;
        String omdbURL = omdbURLBase + omdbSearchString;

        // Set mock callout class    
        Test.setMock(HttpCalloutMock.class, new OmdbConnectionTestMockImplSingle());
        
        // Call method to test.
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        HttpRequest req = new HttpRequest();
        req.setEndpoint(omdbURL);
        req.setMethod('GET');
        Http h = new Http();
        HttpResponse res = h.send(req);
        
        // Verify response received contains fake values
        String actualValue = res.getBody();
        String expectedValue = '{"Title":"The Chronicles of Narnia: The Voyage of the Dawn Treader","Year":"2010","Rated":"PG","Released":"10 Dec 2010","Runtime":"113 min","Genre":"Adventure, Family, Fantasy","Director":"Michael Apted","Writer":"Christopher Markus (screenplay), Stephen McFeely (screenplay), Michael Petroni (screenplay), C.S. Lewis (novel)","Actors":"Georgie Henley, Skandar Keynes, Ben Barnes, Will Poulter","Plot":"Lucy and Edmund Pevensie are stranded in Cambridge, living in the house of their obnoxious cousin Eustace, while the grown-ups Susan and Peter are living in the USA with their parents. When a painting of a ship sailing on the sea of Narnia overflows water in their room, Lucy, Edmund and Eustace are transported to the ocean of Narnia and rescued by King Caspian and the crew of the ship The Dawn Treader. Caspian explains that Narnia has been in peace for three years but before he took his throne back, his uncle tried to kill the seven lords of Telmar, who were the closest and most loyal friends of his father. They fled to The Lone Island and no one has ever heard anything about them. Now Caspian is seeking out the lords of Telmar with his Captain Drinian, the talking mouse Reepicheep and his loyal men. Soon, they discover that an evil form of green mist is threatening Narnia and the siblings and their cousin join Caspian in a quest to retrieve the seven swords of the seven lords of Telmar to save Narnia from evil.","Language":"English","Country":"USA, UK","Awards":"2 wins & 18 nominations.","Poster":"https://m.media-amazon.com/images/M/MV5BNjQ2MDQzMzExNl5BMl5BanBnXkFtZTcwMTYzOTc5Mw@@._V1_SX300.jpg","Ratings":[{"Source":"Internet Movie Database","Value":"6.3/10"},{"Source":"Rotten Tomatoes","Value":"50%"},{"Source":"Metacritic","Value":"53/100"}],"Metascore":"53","imdbRating":"6.3","imdbVotes":"144,840","imdbID":"tt0980970","Type":"movie","DVD":"25 Nov 2015","BoxOffice":"$104,386,950","Production":"Dune, Mark Johnson","Website":"N/A","Response":"True"}';

        System.assertEquals(actualValue, expectedValue);
        System.assertEquals(200, res.getStatusCode());
    }


    @isTest
    static void generateGetMovieStringFromTitle_GivenTitleWithSymbolsAndSpaces_shouldGenerateMovieString(){
        OmdbConnection omdbc = new OmdbConnection();
        String expectedValue = '{"Search":[{"Title":"Harry Potter and the Deathly Hallows: Part 2","Year":"2011","imdbID":"tt1201607","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BMGVmMWNiMDktYjQ0Mi00MWIxLTk0N2UtN2ZlYTdkN2IzNDNlXkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_SX300.jpg"},{"Title":"Harry Potter and the Sorcerers Stone","Year":"2001","imdbID":"tt0241527","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BNjQ3NWNlNmQtMTE5ZS00MDdmLTlkZjUtZTBlM2UxMGFiMTU3XkEyXkFqcGdeQXVyNjUwNzk3NDc@._V1_SX300.jpg"},{"Title":"Harry Potter and the Chamber of Secrets","Year":"2002","imdbID":"tt0295297","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BMTcxODgwMDkxNV5BMl5BanBnXkFtZTYwMDk2MDg3._V1_SX300.jpg"},{"Title":"Harry Potter and the Prisoner of Azkaban","Year":"2004","imdbID":"tt0304141","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BMTY4NTIwODg0N15BMl5BanBnXkFtZTcwOTc0MjEzMw@@._V1_SX300.jpg"},{"Title":"Harry Potter and the Goblet of Fire","Year":"2005","imdbID":"tt0330373","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BMTI1NDMyMjExOF5BMl5BanBnXkFtZTcwOTc4MjQzMQ@@._V1_SX300.jpg"},{"Title":"Harry Potter and the Order of the Phoenix","Year":"2007","imdbID":"tt0373889","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BMTM0NTczMTUzOV5BMl5BanBnXkFtZTYwMzIxNTg3._V1_SX300.jpg"},{"Title":"Harry Potter and the Deathly Hallows: Part 1","Year":"2010","imdbID":"tt0926084","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BMTQ2OTE1Mjk0N15BMl5BanBnXkFtZTcwODE3MDAwNA@@._V1_SX300.jpg"},{"Title":"Harry Potter and the Half-Blood Prince","Year":"2009","imdbID":"tt0417741","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BNzU3NDg4NTAyNV5BMl5BanBnXkFtZTcwOTg2ODg1Mg@@._V1_SX300.jpg"},{"Title":"Harry Potter and the Forbidden Journey","Year":"2010","imdbID":"tt1756545","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BNDM0YzMyNGUtMTU1Yy00OTE2LWE5NzYtZDZhMTBmN2RkNjg3XkEyXkFqcGdeQXVyMzU5NjU1MDA@._V1_SX300.jpg"},{"Title":"Harry Potter and the Chamber of Secrets","Year":"2002","imdbID":"tt0304140","Type":"game","Poster":"https://m.media-amazon.com/images/M/MV5BNTM4NzQ2NjA4NV5BMl5BanBnXkFtZTgwODAwMjE4MDE@._V1_SX300.jpg"}],"totalResults":"110","Response":"True"}';


        // Set mock callout class    
        Test.setMock(HttpCalloutMock.class, new OmdbConnectionTestMockImpl());

        Test.startTest();
        String movies = omdbc.getMovieListFromTitle('#Harry !Potter');
        Test.stopTest();

        System.assertEquals(expectedValue, movies);

    }


    @isTest
    static void generateGetMovieStringFromTitle_GivenNullTitle_shouldNotGenerateMovieString(){
        OmdbConnection omdbc = new OmdbConnection();

        // Set mock callout class    
        Test.setMock(HttpCalloutMock.class, new OmdbConnectionTestMockImpl());

        Test.startTest();

        String title;
        String movies = omdbc.getMovieListFromTitle(title);

        Test.stopTest();

        System.assertEquals(null, movies);
    }


    @isTest
    static void generateGetMovieFromImdbId_GivenImdbId_shouldGenerateMovieString(){
        OmdbConnection omdbc = new OmdbConnection();
        String expectedValue = '{"Title":"The Chronicles of Narnia: The Voyage of the Dawn Treader","Year":"2010","Rated":"PG","Released":"10 Dec 2010","Runtime":"113 min","Genre":"Adventure, Family, Fantasy","Director":"Michael Apted","Writer":"Christopher Markus (screenplay), Stephen McFeely (screenplay), Michael Petroni (screenplay), C.S. Lewis (novel)","Actors":"Georgie Henley, Skandar Keynes, Ben Barnes, Will Poulter","Plot":"Lucy and Edmund Pevensie are stranded in Cambridge, living in the house of their obnoxious cousin Eustace, while the grown-ups Susan and Peter are living in the USA with their parents. When a painting of a ship sailing on the sea of Narnia overflows water in their room, Lucy, Edmund and Eustace are transported to the ocean of Narnia and rescued by King Caspian and the crew of the ship The Dawn Treader. Caspian explains that Narnia has been in peace for three years but before he took his throne back, his uncle tried to kill the seven lords of Telmar, who were the closest and most loyal friends of his father. They fled to The Lone Island and no one has ever heard anything about them. Now Caspian is seeking out the lords of Telmar with his Captain Drinian, the talking mouse Reepicheep and his loyal men. Soon, they discover that an evil form of green mist is threatening Narnia and the siblings and their cousin join Caspian in a quest to retrieve the seven swords of the seven lords of Telmar to save Narnia from evil.","Language":"English","Country":"USA, UK","Awards":"2 wins & 18 nominations.","Poster":"https://m.media-amazon.com/images/M/MV5BNjQ2MDQzMzExNl5BMl5BanBnXkFtZTcwMTYzOTc5Mw@@._V1_SX300.jpg","Ratings":[{"Source":"Internet Movie Database","Value":"6.3/10"},{"Source":"Rotten Tomatoes","Value":"50%"},{"Source":"Metacritic","Value":"53/100"}],"Metascore":"53","imdbRating":"6.3","imdbVotes":"144,840","imdbID":"tt0980970","Type":"movie","DVD":"25 Nov 2015","BoxOffice":"$104,386,950","Production":"Dune, Mark Johnson","Website":"N/A","Response":"True"}';

        // Set mock callout class    
        Test.setMock(HttpCalloutMock.class, new OmdbConnectionTestMockImplSingle());

        Test.startTest();
        String movie = omdbc.getMovieFromId('tt0980970');
        Test.stopTest();

        System.assertEquals(movie, expectedValue);

    }


    @isTest
    static void generateGetMovieStringFromImdbId_GivenNullImdbId_shouldNotGenerateMovieString(){
        OmdbConnection omdbc = new OmdbConnection();

        // Set mock callout class    
        Test.setMock(HttpCalloutMock.class, new OmdbConnectionTestMockImplSingle());

        Test.startTest();

        String imdbId;
        String movie = omdbc.getMovieFromId(imdbId);

        Test.stopTest();

        System.assertEquals(null, movie);
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
        String expected = 'Harry%20Potter';
        String resultString = omdbc.cleanseTitleString(title);

        Test.stopTest();

        Boolean result = false;
        Pattern symbolPattern = Pattern.compile('^[a-zA-Z0-9%]');
        Matcher symbolMatcher = symbolPattern.matcher(resultString.trim());

        if(symbolMatcher.matches()){
            result = true;
        }

        System.assertEquals(false, result);
        System.assertEquals(expected, resultString);
    }

    @isTest
    static void generateGetTitleFromJsonMap_givenStringWithJson_shouldGenereateTitleObject(){
        OmdbConnection omdbConnection = new OmdbConnection();
        String titleObject = '{"Title":"The Chronicles of Narnia: The Voyage of the Dawn Treader","Year":"2010","Rated":"PG","Released":"10 Dec 2010","Runtime":"113 min","Genre":"Adventure, Family, Fantasy","Director":"Michael Apted","Writer":"Christopher Markus (screenplay), Stephen McFeely (screenplay), Michael Petroni (screenplay), C.S. Lewis (novel)","Actors":"Georgie Henley, Skandar Keynes, Ben Barnes, Will Poulter","Plot":"Lucy and Edmund Pevensie are stranded in Cambridge, living in the house of their obnoxious cousin Eustace, while the grown-ups Susan and Peter are living in the USA with their parents. When a painting of a ship sailing on the sea of Narnia overflows water in their room, Lucy, Edmund and Eustace are transported to the ocean of Narnia and rescued by King Caspian and the crew of the ship The Dawn Treader. Caspian explains that Narnia has been in peace for three years but before he took his throne back, his uncle tried to kill the seven lords of Telmar, who were the closest and most loyal friends of his father. They fled to The Lone Island and no one has ever heard anything about them. Now Caspian is seeking out the lords of Telmar with his Captain Drinian, the talking mouse Reepicheep and his loyal men. Soon, they discover that an evil form of green mist is threatening Narnia and the siblings and their cousin join Caspian in a quest to retrieve the seven swords of the seven lords of Telmar to save Narnia from evil.","Language":"English","Country":"USA, UK","Awards":"2 wins & 18 nominations.","Poster":"https://m.media-amazon.com/images/M/MV5BNjQ2MDQzMzExNl5BMl5BanBnXkFtZTcwMTYzOTc5Mw@@._V1_SX300.jpg","Ratings":[{"Source":"Internet Movie Database","Value":"6.3/10"},{"Source":"Rotten Tomatoes","Value":"50%"},{"Source":"Metacritic","Value":"53/100"}],"Metascore":"53","imdbRating":"6.3","imdbVotes":"144,840","imdbID":"tt0980970","Type":"movie","DVD":"25 Nov 2015","BoxOffice":"$104,386,950","Production":"Dune, Mark Johnson","Website":"N/A","Response":"True"}';
        Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(titleObject);

        Test.startTest();
        Title__c newTitle = omdbConnection.getTitleFromJsonMap(jsonMap);
        Test.stopTest();

        System.assertNotEquals(null, newTitle);
        
    }    
    
    
    @isTest
    static void generateGetMonthAsDigits_givenJan_shouldGenerate01(){        
        OmdbConnection omdbConnection = new OmdbConnection();
        String month    = 'Jan';
        String expected = '01';

        Test.startTest();
        String result = omdbConnection.getMonthAsDigits(month);
        Test.stopTest();

        System.assertEquals(expected, result);
    }

    @isTest
    static void generateGetMonthAsDigits_givenFeb_shouldGenerate02(){        
        OmdbConnection omdbConnection = new OmdbConnection();
        String month    = 'Feb';
        String expected = '02';

        Test.startTest();
        String result = omdbConnection.getMonthAsDigits(month);
        Test.stopTest();

        System.assertEquals(expected, result);
    }

    
    @isTest
    static void generateGetMonthAsDigits_givenMar_shouldGenerate03(){        
        OmdbConnection omdbConnection = new OmdbConnection();
        String month    = 'Mar';
        String expected = '03';

        Test.startTest();
        String result = omdbConnection.getMonthAsDigits(month);
        Test.stopTest();

        System.assertEquals(expected, result);
    }

    
    @isTest
    static void generateGetMonthAsDigits_givenApr_shouldGenerate04(){        
        OmdbConnection omdbConnection = new OmdbConnection();
        String month    = 'Apr';
        String expected = '04';

        Test.startTest();
        String result = omdbConnection.getMonthAsDigits(month);
        Test.stopTest();

        System.assertEquals(expected, result);
    }

    
    @isTest
    static void generateGetMonthAsDigits_givenMay_shouldGenerate05(){        
        OmdbConnection omdbConnection = new OmdbConnection();
        String month    = 'May';
        String expected = '05';

        Test.startTest();
        String result = omdbConnection.getMonthAsDigits(month);
        Test.stopTest();

        System.assertEquals(expected, result);
    }

    
    @isTest
    static void generateGetMonthAsDigits_givenJun_shouldGenerate06(){        
        OmdbConnection omdbConnection = new OmdbConnection();
        String month    = 'Jun';
        String expected = '06';

        Test.startTest();
        String result = omdbConnection.getMonthAsDigits(month);
        Test.stopTest();

        System.assertEquals(expected, result);
    }

    
    @isTest
    static void generateGetMonthAsDigits_givenJul_shouldGenerate07(){        
        OmdbConnection omdbConnection = new OmdbConnection();
        String month    = 'Jul';
        String expected = '07';

        Test.startTest();
        String result = omdbConnection.getMonthAsDigits(month);
        Test.stopTest();

        System.assertEquals(expected, result);
    }

    
    @isTest
    static void generateGetMonthAsDigits_givenAug_shouldGenerate08(){        
        OmdbConnection omdbConnection = new OmdbConnection();
        String month    = 'Aug';
        String expected = '08';

        Test.startTest();
        String result = omdbConnection.getMonthAsDigits(month);
        Test.stopTest();

        System.assertEquals(expected, result);
    }

    
    @isTest
    static void generateGetMonthAsDigits_givenSep_shouldGenerate09(){        
        OmdbConnection omdbConnection = new OmdbConnection();
        String month    = 'Sep';
        String expected = '09';

        Test.startTest();
        String result = omdbConnection.getMonthAsDigits(month);
        Test.stopTest();

        System.assertEquals(expected, result);
    }

    
    @isTest
    static void generateGetMonthAsDigits_givenOct_shouldGenerate10(){        
        OmdbConnection omdbConnection = new OmdbConnection();
        String month    = 'Oct';
        String expected = '10';

        Test.startTest();
        String result = omdbConnection.getMonthAsDigits(month);
        Test.stopTest();

        System.assertEquals(expected, result);
    }

    
    @isTest
    static void generateGetMonthAsDigits_givenNov_shouldGenerate11(){        
        OmdbConnection omdbConnection = new OmdbConnection();
        String month    = 'Nov';
        String expected = '11';

        Test.startTest();
        String result = omdbConnection.getMonthAsDigits(month);
        Test.stopTest();

        System.assertEquals(expected, result);
    }

    
    @isTest
    static void generateGetMonthAsDigits_givenDec_shouldGenerate12(){        
        OmdbConnection omdbConnection = new OmdbConnection();
        String month    = 'Dec';
        String expected = '12';

        Test.startTest();
        String result = omdbConnection.getMonthAsDigits(month);
        Test.stopTest();

        System.assertEquals(expected, result);
    }


    
    @isTest
    static void generateGetMonthAsDigits_givenInvalid_shouldGenerateNull(){        
        OmdbConnection omdbConnection = new OmdbConnection();
        String month    = 'ajsgoiajsodigja';
        String expected;

        Test.startTest();
        String result = omdbConnection.getMonthAsDigits(month);
        Test.stopTest();

        System.assertEquals(expected, result);
    }
    

    @isTest
    static void generateOmdbConnectionClass_givenNothing_shouldGenerateConnectionClass(){
        Test.startTest();
        OmdbConnection movie = new OmdbConnection();
        Test.stopTest();

        System.assertNotEquals(null, movie);
    }
}
