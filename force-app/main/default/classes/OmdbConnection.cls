global with sharing class OmdbConnection {
    private String httpMethod = 'GET';
    private String omdbURLBase = 'http://www.omdbapi.com/';
    private String omdbKey = '4339b121';
    
    public void OmdbConnection(){}

    // Have the user enter a title and recieve a list of movies.
    public String getMovieListFromTitle(String title){
        if(title == null){
            System.debug('Title was null, unable to process.');
            return null;
        }

        title = cleanseTitleString(title);

        HttpResponse res = getOmdbResponseFromTitle(title);

        return res.getBody();
    }


    public HttpResponse getOmdbResponseFromTitle(String title){
        // Prepares the search term for the OMDB:
        //  -> s='title' provides multiple titles with partial info. 
        //  -> t='title' would provide a single title will full info.
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


    public String getMovieFromId(String imdbId){
        if(imdbId == null){
            System.debug('Title was null, unable to process.');
            return null;
        }

        HttpResponse res = getOmdbResponseFromImdbId(imdbId);

        return res.getBody();
    }


    public HttpResponse getOmdbResponseFromImdbId(String imdbId){
        // Prepares the search term for the OMDB:
        //  -> s='title' provides multiple titles with partial info. 
        //  -> t='title' would provide a single title with full info.
        //  -> i='imdbID' provides a single title with full info.
        String omdbSearchString = '?i=' + imdbId + '&plot=full&apikey=' + omdbKey;
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

    
    public Title__c getTitleFromJsonMap(Map<String, Object> jsonMap){
        Title__c newTitle = new Title__c();

        String debugString = '\nFull Movie Info: \n';
        for (String key : jsonMap.keyset()){
            String toAddress = jsonMap.get(key).toString();
            debugString = debugString + key + ': ' + toAddress + '\n';
        }
        System.debug(debugString);
        
        // Must prep the date string to convert it into a Date variable.
        //      -> The format of the date is originally (dd mmm yyyy).
        //      -> Must be changed to (mm/dd/yyyy)
        String datePrepString = jsonMap.get('Released').toString();
        List<String> dateList = datePrepString.split(' ');
        dateList.set(1, getMonthAsDigits(dateList.get(1)));
        datePrepString = dateList.get(1) + '/' + dateList.get(0) + '/' + dateList.get(2);
        System.debug('datePrep: ' + datePrepString);
        Date releaseDate = Date.parse(datePrepString);

        // Must prep the runtime string to convert it into a Decimal variable.
        String runTimePrep = jsonMap.get('Runtime').toString();
        if(runTimePrep != 'N/A'){
            runTimePrep = runTimePrep.replaceAll(' min', '');
            System.debug('runTimePrep: ' + runTimePrep);
            Decimal runTime = Decimal.valueOf(runTimePrep);
            
            newTitle.Runtime__c             = runTime;
        }

        newTitle.ImdbID__c              = jsonMap.get('imdbID').toString();
        newTitle.Director__c            = jsonMap.get('Director').toString();
        newTitle.Genre__c               = jsonMap.get('Genre').toString();
        newTitle.Language__c            = jsonMap.get('Language').toString();
        newTitle.Notable_Actors__c      = jsonMap.get('Actors').toString();
        newTitle.Plot_Description__c    = jsonMap.get('Plot').toString();
        newTitle.Poster__c              = jsonMap.get('Poster').toString();
        newTitle.Release_Date__c        = releaseDate;
        newTitle.Thumbnail__c           = jsonMap.get('Poster').toString();
        newTitle.Name                   = jsonMap.get('Title').toString();
        newTitle.Writer__c              = jsonMap.get('Writer').toString();

        return newTitle;

    }


    public String cleanseTitleString(String title){
        // Replace spaces with HTML friendly code.
        title = title.replaceAll(' ', '%20');
        title = title.replaceAll('&', '%26');
        System.debug('Spaces replaced: ' + title);

        // Cleanse the string of special symbols.
        title = title.replaceAll('[^a-zA-z0-9%\\s+]', '');
        title = title.trim();
        System.debug('Extra symbols removed: ' + title);

        return title;
    }



    public String getMonthAsDigits(String month){

        switch on month {
            when 'Jan' {
                return '01';
            }
            when 'Feb' {
                return '02';
            }
            when 'Mar' {
                return '03';
            }
            when 'Apr' {
                return '04';
            }
            when 'May' {
                return '05';
            }
            when 'Jun' {
                return '06';
            }
            when 'Jul' {
                return '07';
            }
            when 'Aug' {
                return '08';
            }
            when 'Sep' {
                return '09';
            }
            when 'Oct'{
                return '10';
            }
            when 'Nov' {
                return '11';
            }
            when 'Dec' {
                return '12';
            }
            when else {
                return null;
            }
        }
    }


}
