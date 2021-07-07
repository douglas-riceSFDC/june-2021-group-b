@isTest
global class OmdbConnectionTestMockImpl {

    global HttpResponse respond(HTTPRequest req){
        OmdbConnection omdbc = new OmdbConnection();
        HttpResponse res = omdbc.getOmdbResponse('Harry');

        Test.startTest();

        List<OmdbWrapperClass> movies = omdbc.parseOmdbJsonFromHttpResponse(res);
        

        Test.stopTest();

        System.assert(movies.size() > 0);

         //System.assertEquals('http://api.salesforce.com/foo/bar', req.getEndpoint());
        System.assertEquals(System.Label.Integration_URL+'?sfdcid=0011300001schfFAAQ&operation=create', req.getEndpoint());
        System.assertEquals('POST', req.getMethod());
        HttpResponse res = new HttpResponse();
        
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"Search":[{"Title":"Inception","Year":"2010","imdbID":"tt1375666","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_SX300.jpg"},{"Title":"Inception: The Cobol Job","Year":"2010","imdbID":"tt5295894","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BMjE0NGIwM2EtZjQxZi00ZTE5LWExN2MtNDBlMjY1ZmZkYjU3XkEyXkFqcGdeQXVyNjMwNzk3Mjk@._V1_SX300.jpg"},{"Title":"Inception: Jump Right Into the Action","Year":"2010","imdbID":"tt5295990","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BZGFjOTRiYjgtYjEzMS00ZjQ2LTkzY2YtOGQ0NDI2NTVjOGFmXkEyXkFqcGdeQXVyNDQ5MDYzMTk@._V1_SX300.jpg"},{"Title":"Inception: Motion Comics","Year":"2010–","imdbID":"tt1790736","Type":"series","Poster":"https://m.media-amazon.com/images/M/MV5BNGRkYzkzZmEtY2YwYi00ZTlmLTgyMTctODE0NTNhNTVkZGIxXkEyXkFqcGdeQXVyNjE4MDMwMjk@._V1_SX300.jpg"},{"Title":"The Crack: Inception","Year":"2019","imdbID":"tt6793710","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BZTU1M2U4OWUtZTQ5OS00OWM1LTljN2EtMWJmZDgxNzUwZGNkXkEyXkFqcGdeQXVyMTA0MjU0Ng@@._V1_SX300.jpg"},{"Title":"Inception","Year":"2014","imdbID":"tt7321322","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BYWJmYWJmNWMtZTBmNy00M2MzLTg5ZWEtOGU5ZWRiYTE0ZjVmXkEyXkFqcGdeQXVyNzkyOTM2MjE@._V1_SX300.jpg"},{"Title":"Inception: 4Movie Premiere Special","Year":"2010","imdbID":"tt1686778","Type":"movie","Poster":"N/A"},{"Title":"WWA: The Inception","Year":"2001","imdbID":"tt0311992","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BNTEyNGJjMTMtZjZhZC00ODFkLWIyYzktN2JjMTcwMmY5MDJlXkEyXkFqcGdeQXVyNDkwMzY5NjQ@._V1_SX300.jpg"},{"Title":"Cyberalien: Inception","Year":"2017","imdbID":"tt7926130","Type":"movie","Poster":"N/A"},{"Title":"Bikini Inception","Year":"2015","imdbID":"tt8269586","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BNDk3NTNmNGEtOWJkYi00NGEyLThkZDQtOTBlZmRhN2IwYTk0XkEyXkFqcGdeQXVyNTM3MDMyMDQ@._V1_SX300.jpg"}],"totalResults":"27","Response":"True"}');
        res.setStatusCode(200);
        return res;

    }
}
