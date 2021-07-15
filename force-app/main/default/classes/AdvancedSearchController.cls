public class AdvancedSearchController {
 		  
    @AuraEnabled
    public static List<Title__c> getTitleList(String fieldName, String searchVal){
       	 String MOVIE_TITLE = 'Movie Title';
         String ACTOR = 'Actor';
         String DIRECTOR = 'Director';
         String WRITER = 'Writer';
        
        List<Title__c> titleList = new List<Title__c>();
        String val = '%'+searchVal+'%';
       
        Switch on fieldName{
            when 'Movie Title'{
                try{
                    titleList = [SELECT Id, Name 
                             FROM Title__c 
                             WHERE Name 
                             LIKE :val];
                }
                 catch(Exception e){
                    system.debug('AdvancedSearchController Error: '+e);
                }
                
            }
            when 'Actor'{
                try{
                    titleList = [SELECT Id, Name 
                             FROM Title__c 
                             WHERE Notable_Actors__c 
                             LIKE :val];
                } 
                catch(Exception e){
                    system.debug('AdvancedSearchController Error: '+e);
                }
                
            }
            when 'Director'{
                try{ 
                    titleList = [SELECT Id, Name 
                             FROM Title__c 
                             WHERE Director__c 
                             LIKE :val];
                }
                catch(Exception e){
                    system.debug('AdvancedSearchController Error: '+e);
                }
            }
            when 'Writer'{
                try{
                    titleList = [SELECT Id, Name 
                             FROM Title__c 
                             WHERE Writer__c 
                             LIKE :val];
                }
                 catch(Exception e){
                    system.debug('AdvancedSearchController Error: '+e);
                }
                
            }
            when else{
                try{
                    titleList = [SELECT Id, Name 
                             FROM Title__c 
                             WHERE Name LIKE: val
                             OR Notable_Actors__c LIKE: val
                             OR Writer__c LIKE: val
                             OR Director__c LIKE: val];
                }
                catch(Exception e){
                    system.debug('AdvancedSearchController Error: '+e);
                }
                
            }
        }
        return titleList;
    }
}