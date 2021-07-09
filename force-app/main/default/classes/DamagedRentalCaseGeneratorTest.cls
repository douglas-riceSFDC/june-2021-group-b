@isTest
private class DamagedRentalCaseGeneratorTest {
    @TestSetup
    static void setupStockData(){
        Title__c testTitle = TestDataFactory.createTitle('Test Movie', 'Action');
        insert testTitle;

        Stock__c testStock = TestDataFactory.createStock(testTitle.Id, 'Available');
        insert testStock; 

        Stock__c testStock2 = TestDataFactory.createStock(testTitle.Id, 'Available');
        insert testStock2; 

        Stock__c testStock3 = TestDataFactory.createStock(testTitle.Id, 'Available');
        insert testStock3; 
  
    

    }

    @isTest
    static void generateCasesForDamagedUpdatedStock_givenADamagedStock_shouldGenerateACase() {

        List<Stock__c> testStock = [SELECT Status__c FROM Stock__c];

        Test.startTest();

        testStock[0].Status__c = 'Damaged';
        testStock[0].Damage_Description__c = 'Its sctrached';
        update testStock[0];

        Test.stopTest();

        List<Case> generatedCases = [SELECT Id FROM Case];
        System.assertEquals(1, generatedCases.size(), 'One case should have been generated');

    }


    @isTest
    static void generateCasesForDamagedUpdatedStock_givenMultipleDamagedStock_shouldGenerateMultipleCases() {

        List<Stock__c> testStock = [SELECT Status__c FROM Stock__c];
        List<Stock__c> stockToUpdate = new List<Stock__c>();

        Test.startTest();

        for (integer i = 0; i<3; i++)
        {

            testStock[i].Status__c = 'Damaged';
            testStock[i].Damage_Description__c = 'Its sctrached';
            stockToUpdate.add(testStock[i]);
        }
        update stockToUpdate;

        Test.stopTest();

        List<Case> generatedCases = [SELECT Id FROM Case];
        System.assertEquals(3, generatedCases.size(), 'Three cases should have been generated');

    }

    @isTest
    static void generateCasesForDamagedUpdatedStock_givenANonDamagedStock_shouldNotGenerateACase() {

        List<Stock__c> testStock = [SELECT Status__c FROM Stock__c];

        Test.startTest();

        testStock[0].Status__c = 'Rented';
        update testStock[0];

        Test.stopTest();

        List<Case> generatedCases = [SELECT Id FROM Case];
        System.assertEquals(0, generatedCases.size(), 'No cases should have been generated');

    }

 
    @isTest
    static void generateCasesForDamagedInsertedStock_givenAnInsertedDamageStock_shouldGenerateACase() {

        Title__c testTitle = TestDataFactory.createTitle('Test', 'Action');
        insert testTitle;

        Test.startTest();
        Stock__c s = new Stock__c();
        s.Title__c = testTitle.id;
        s.Status__c = 'Damaged';
        s.Damage_Description__c = 'Test-Damage';
       
        insert s;

        Test.stopTest();

        List<Case> generatedCases = [SELECT Id FROM Case];
        System.assertEquals(1, generatedCases.size(), 'One case should have been generated');

    }


}

