public with sharing class DamagedRentalCaseGenerator {
    public void generateCasesForDamagedUpdatedStock(List<Stock__c> updatedStock, 
    Map<Id, Stock__c> oldStockValueMap) {

    Database.DMLOptions dmlOpts = createDMLOptions();

    List<Case> generatedCases = new List<Case>();

    Case newCase;
   
        for(Stock__c s : updatedStock) {
        if(s.Status__c == 'Damaged' && oldStockValueMap.get(s.Id).Status__c != 'Damaged') {
            newCase = createDamageCase(newCase, s.Id);
            newCase.setOptions(dmlOpts);
            generatedCases.add(newCase);
            }
            
        }

    insert generatedCases;
    }

    public void generateCasesForDamagedInsertedStock(List<Stock__c> updatedStock) {

    Database.DMLOptions dmlOpts = createDMLOptions();

    List<Case> generatedCases = new List<Case>();

    Case newCase;
        for(Stock__c s : updatedStock) {
        if(s.Status__c == 'Damaged') {
            newCase = createDamageCase(newCase, s.Id);
            newCase.setOptions(dmlOpts);
            generatedCases.add(newCase);
            }
        }

    insert generatedCases;
    }

 

    private Case createDamageCase(Case newCase, Id stockID) {

    newCase = new Case();
    newCase.Stock__c = stockID;
    newCase.Status = 'New';
    newCase.Origin = 'Web';
    newCase.Subject = 'Maintenance Required';


    return newCase;

    }

    private Database.DMLOptions createDMLOptions() {

    //Fetching the assignment rules on case - Following Help article - https://help.salesforce.com/articleView?id=000338182&type=1&mode=1
    AssignmentRule AR = new AssignmentRule();
    AR = [select id from AssignmentRule where SobjectType = 'Case' and Active = true limit 1];

    //Creating the DMLOptions for "Assign using active assignment rules" checkbox
    Database.DMLOptions dmlOpts = new Database.DMLOptions();
    dmlOpts.assignmentRuleHeader.assignmentRuleId= AR.id;


    return dmlOpts;

    }
}
