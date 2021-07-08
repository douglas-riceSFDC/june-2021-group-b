public class RentalWrapper {
    @AuraEnabled
    public Rental__c rentedTitle;

    @AuraEnabled
    public Boolean isOverDue;
    
    public RentalWrapper(Rental__c rental) {
            this.isOverDue = rental.Due_Date__c > System.today();
            this.rentedTitle = rental;

    }
}