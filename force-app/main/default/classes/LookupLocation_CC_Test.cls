@isTest
private with sharing class LookupLocation_CC_Test {

    
    
   @TestSetup public static void populateLocations(){
        
        List<Location__c> testLocations;
        for(Integer i = 1; i < 1; i++) {
            Location__c l = new Location__c();
            l.Name='testing' + i; 
            l.Location_Type__c='Recording Studio'; 
            l.Address__c='123 Memory Lane'; 
            testLocations.add(l);
        
        }
        insert testLocations;
        
        
    }

    @isTest static void LookupLocation_CC_Test() {
        System.Test.startTest();
        //List<Location__c> ls = populateLocations.testLocations;
        Location__c check = [SELECT Address__c FROM Location__c LIMIT 1];

        //System.assertEquals(ls.Address__c, check);
        System.Test.stopTest();
    }
    
    
    
}
