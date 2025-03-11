// public with sharing class houseService {
//     public houseService() {

//     }
// }

// Creating a class of houseService, which has the methods named getRecords. which returns a list of house records.
// By querying the House__c Object.
// NOTE: in HouseService Apex class, we automatically surface the object(House__c) as a class without writing the class file.
// we can also refrence the fields in House__c object as properties without having to declare it.

public with sharing class houseService {
    @AuraEnabled(cacheable = true)
    public static List<House__c> getRecords(){
        try {
            // Creates a list of House records using SOQL query.
            List<House__c> lstHouses = [
                select Id, Name, Address__c, State__c, City__c, Zip__c from House__c with USER_MODE ORDER BY CreatedDate LIMIT 10
            ];
            return lstHouses;
        } catch (Exception e) {
            // Handles Exception..
            throw new AuraHandledException(e.getMessage());
        }
    }
}