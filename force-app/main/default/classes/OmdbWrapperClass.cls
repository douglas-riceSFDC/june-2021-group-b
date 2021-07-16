// This class is unused. Leaving for future reference (testing, etc...). 

public with sharing class OmdbWrapperClass {
    private String title;
    private String year;
    private String rating;
    private String releaseDate;
    private String runTime;
    private String genre;
    private String director;
    private String writer;
    private String actor;
    private String plot;
    private String language;
    private String country;
    private String awards;
    private String ratings;
    private String metascore;
    private String imdbRating;
    private String imdbVotes;
    private String imdbID;
    private String type;
    private String dvdRelease;
    private String boxOffice;
    private String production;
    private String posterUrl;

    public OmdbWrapperClass() {}

    public OmdbWrapperClass(String title, String year, String imdbID, String type, String posterUrl){
        this.title      = title;
        this.year       = year;
        this.imdbID     = imdbID;
        this.type       = type;
        this.posterUrl  = posterUrl;
    }

    public String getTitle(){
        return this.title;
    }

    public String getYear(){
        return this.year;
    }

    public String getRating(){
        return this.rating;
    }

    public String getDate(){
        return this.releaseDate;
    }

    public String getRunTime(){
        return this.runTime;
    }

    public String getGenre(){
        return this.genre;
    }

    public String getDirector(){
        return this.director;
    }

    public String getWriter(){
        return this.writer;
    }

    public String getActor(){
        return this.actor;
    }

    public String getPlot(){
        return this.plot;
    }

    public String getLanguage(){
        return this.language;
    }

    public String getCountry(){
        return this.country;
    }

    public String getAwards(){
        return this.getAwards();
    }

    public String getRatings(){
        return this.ratings;
    }

    public String getMetascore(){
        return this.metascore;
    }

    public String getImdbRating(){
        return this.imdbRating;
    }

    public String getImdbVotes(){
        return this.imdbVotes;
    }

    public String getImdbId(){
        return this.imdbID;
    }

    public String getType(){
        return this.type;
    }

    public String getDvdRelease(){
        return this.dvdRelease;
    }

    public String getBoxOffice(){
        return this.boxOffice;
    }

    public String getProduction(){
        return this.production;
    }

    public String getPosterUrl(){
        return this.posterUrl;
    }

    public void setTitle(String title){
        this.title = title;
    }

    public void setYear(String year){
        this.year = year;
    }

    public void setRating(String rating){
        this.rating = rating;
    }

    public void setReleaseDate(String releaseDate){
        this.releaseDate = releaseDate;
    }

    public void setRunTime(String runTime){
        this.runTime = runTime;
    }

    public void setGenre(String genre){
        this.genre = genre;
    }

    public void setDirector(String director){
        this.director = director;
    }

    public void setWriter(String writer){
        this.writer = writer;
    }

    public void setActor(String actor){
        this.actor = actor;
    }

    public void setPlot(String plot){
        this.plot = plot;
    }

    public void setLanguage(String language){
        this.language = language;
    }

    public void setCountry(String country){
        this.country = country;
    }

    public void setAwards(String awards){
        this.awards = awards;
    }

    public void setRatings(String ratings){
        this.ratings = ratings;
    }

    public void setMetascore(String metascore){
        this.metascore = metascore;
    }

    public void setImdbVotes(String imdbVotes){
        this.imdbVotes = imdbVotes;
    }

    public void setImbdId(String imdbID){
        this.imdbID = imdbID;
    }

    public void setType(String type){
        this.type = type;
    }

    public void setDvdRelease(String dvdRelease){
        this.dvdRelease = dvdRelease;
    }

    public void setBoxOffice(String boxOffice){
        this.boxOffice = boxOffice;
    }

    public void setProduction(String production){
        this.production = production;
    }

    public void setPosterUrl(String posterUrl){
        this.posterUrl = posterUrl;
    }

    public void printAll(){
        System.debug(                           + '\n' +
            '---------------------------------' + '\n' +
            'Movie info:'                       + '\n' +
            'Title: '       + this.title        + '\n' +
            'Year: '        + this.year         + '\n' +
            'ImdbId: '      + this.imdbID       + '\n' +
            'Type: '        + this.type         + '\n' +
            'PosterURL: '   + this.posterUrl    + '\n' +
            '---------------------------------'
        );
    }
}   
