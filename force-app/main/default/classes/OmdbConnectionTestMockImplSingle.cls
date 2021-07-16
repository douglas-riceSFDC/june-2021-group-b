@isTest
global class OmdbConnectionTestMockImplSingle implements HttpCalloutMock{
    private String omdbURLBase = 'http://www.omdbapi.com/';
    private String omdbKey = '4339b121';

    global HttpResponse respond(HTTPRequest req){     
    String omdbSearchString = '?i=' + 'tt0980970' + '&plot=full&apikey=' + omdbKey;
    String omdbURL = omdbURLBase + omdbSearchString;

        System.assertEquals(omdbURL, req.getEndpoint());
        System.assertEquals('GET', req.getMethod());

        HttpResponse res = new HttpResponse();

        res.setBody('{"Title":"The Chronicles of Narnia: The Voyage of the Dawn Treader","Year":"2010","Rated":"PG","Released":"10 Dec 2010","Runtime":"113 min","Genre":"Adventure, Family, Fantasy","Director":"Michael Apted","Writer":"Christopher Markus (screenplay), Stephen McFeely (screenplay), Michael Petroni (screenplay), C.S. Lewis (novel)","Actors":"Georgie Henley, Skandar Keynes, Ben Barnes, Will Poulter","Plot":"Lucy and Edmund Pevensie are stranded in Cambridge, living in the house of their obnoxious cousin Eustace, while the grown-ups Susan and Peter are living in the USA with their parents. When a painting of a ship sailing on the sea of Narnia overflows water in their room, Lucy, Edmund and Eustace are transported to the ocean of Narnia and rescued by King Caspian and the crew of the ship The Dawn Treader. Caspian explains that Narnia has been in peace for three years but before he took his throne back, his uncle tried to kill the seven lords of Telmar, who were the closest and most loyal friends of his father. They fled to The Lone Island and no one has ever heard anything about them. Now Caspian is seeking out the lords of Telmar with his Captain Drinian, the talking mouse Reepicheep and his loyal men. Soon, they discover that an evil form of green mist is threatening Narnia and the siblings and their cousin join Caspian in a quest to retrieve the seven swords of the seven lords of Telmar to save Narnia from evil.","Language":"English","Country":"USA, UK","Awards":"2 wins & 18 nominations.","Poster":"https://m.media-amazon.com/images/M/MV5BNjQ2MDQzMzExNl5BMl5BanBnXkFtZTcwMTYzOTc5Mw@@._V1_SX300.jpg","Ratings":[{"Source":"Internet Movie Database","Value":"6.3/10"},{"Source":"Rotten Tomatoes","Value":"50%"},{"Source":"Metacritic","Value":"53/100"}],"Metascore":"53","imdbRating":"6.3","imdbVotes":"144,840","imdbID":"tt0980970","Type":"movie","DVD":"25 Nov 2015","BoxOffice":"$104,386,950","Production":"Dune, Mark Johnson","Website":"N/A","Response":"True"}');
        res.setStatusCode(200);
        return res;

    }

}
