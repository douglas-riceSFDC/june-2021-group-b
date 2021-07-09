trigger Stock on Stock__c (after update, after insert) {
    if(Trigger.isAfter && Trigger.isUpdate) {
        RentalGenerator generator = new RentalGenerator();
        generator.generateRentalsForRentedStock(Trigger.new, Trigger.oldMap);

        DamagedRentalCaseGenerator damagedGenerator = new DamagedRentalCaseGenerator();
        damagedGenerator.generateCasesForDamagedUpdatedStock(Trigger.new, Trigger.oldMap);

    }

    if(Trigger.isAfter && Trigger.isInsert) {

       DamagedRentalCaseGenerator damagedGenerator = new DamagedRentalCaseGenerator();
       damagedGenerator.generateCasesForDamagedInsertedStock(Trigger.new);

    }

}