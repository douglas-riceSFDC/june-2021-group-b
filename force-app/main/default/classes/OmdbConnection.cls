global with sharing class OmdbConnection {
    private String httpMethod = 'GET';
    private String omdbURLBase = 'http://www.omdbapi.com/';

    // (?) TODO: Reference from encrypted .txt file (?)
    private String omdbKey = '4339b121';

    public void OmdbConnection(){}

    // Have the user en
    public List<OmdbWrapperClass> getMovieListFromTitle(String title){
        if(title == null){
            System.debug('Title was null, unable to process.');
            return null;
        }

        title = cleanseTitleString(title);

        HttpResponse res = getOmdbResponse(title);

        List<OmdbWrapperClass> movies = parseOmdbJsonFromHttpResponse(res);

        return movies;

    }

    public HttpResponse getOmdbResponse(String title){
        // Prepares the search term for the OMDB:
        //  -> s='title' provides multiple titles. 
        //  -> t='title' would provide a single title.
        String omdbSearchString = '?s=%27' + title + '%27&apikey=' + omdbKey;
        String omdbURL = omdbURLBase + omdbSearchString;

        httpRequest req = new httpRequest();
        req.setMethod(httpMethod);
        req.setEndpoint(omdbURL);
        req.setTimeout(10000);


        http h = new http();
        httpResponse res = h.send(req);

        system.debug(res.toString());
        system.debug(res.getBody());

        return res;

    }

    public String cleanseTitleString(String title){
        // Replace spaces with HTML friendly code.
        title = title.replace(' ', '%20');
        System.debug('Spaces replaced: ' + title);

        // Cleanse the string of special symbols.
        title = title.replaceAll('[^a-zA-z0-9%\\s+]', '');
        System.debug('Extra symbols removed: ' + title);

        return title;
    }

    public List<OmdbWrapperClass> parseOmdbJsonFromHttpResponse(HttpResponse res){

        List<OmdbWrapperClass> movies = new List<OmdbWrapperClass>();
        String JSONContent = res.getBody();
        
        System.JSONParser parser = JSON.createParser(JSONContent);
        
        // Parse through the tokens to find
        //      {Title, Year, imdbID, Type, PosterURL}
        // for each movie.
        while(parser.nextToken() != null){
            OmdbWrapperClass movie = new OmdbWrapperClass();
            
            if( (parser.getCurrentToken() == JSONToken.FIELD_NAME) && 
                        (parser.getText() == 'Title') ){
                parser.nextToken();

                system.debug('Title: ' + parser.getText());
                movie.setTitle(parser.getText());

                parser.nextToken();
            }

            if( (parser.getCurrentToken() == JSONToken.FIELD_NAME) && 
                        (parser.getText() == 'Year') ){
                parser.nextToken();

                system.debug('Year: ' + parser.getText());
                movie.setYear(parser.getText());

                parser.nextToken();
            }

            if( (parser.getCurrentToken() == JSONToken.FIELD_NAME) && 
                        (parser.getText() == 'imdbID') ){
                parser.nextToken();

                system.debug('imdbID: ' + parser.getText());
                movie.setImbdId(parser.getText());

                parser.nextToken();
            }

            if( (parser.getCurrentToken() == JSONToken.FIELD_NAME) && 
                        (parser.getText() == 'Type') ){
                parser.nextToken();

                system.debug('Type: ' + parser.getText());
                movie.setType(parser.getText());

                parser.nextToken();
            }

            if( (parser.getCurrentToken() == JSONToken.FIELD_NAME) && 
                        (parser.getText() == 'Poster') ){
                parser.nextToken();

                system.debug('Poster: ' + parser.getText());
                movie.setPosterUrl(parser.getText());

                // Once the posterUrl has been assigned we know 
                //      we are at the end of a movie JSON object, 
                //      we can add the movie to our List and begin 
                //      a new assignment.
                movies.add(movie);
            }

        }

        return movies;

    }

}
