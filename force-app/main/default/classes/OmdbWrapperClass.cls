// This class is used to hold the data recieved from the HTMLResponse from the OMDB.
public with sharing class OmdbWrapperClass {
    private String title;
    private String year;
    private String imdbID;
    private String type;
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

    public String getImdbId(){
        return this.imdbID;
    }

    public String getType(){
        return this.type;
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

    public void setImbdId(String imdbID){
        this.imdbID = imdbID;
    }

    public void setType(String type){
        this.type = type;
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
