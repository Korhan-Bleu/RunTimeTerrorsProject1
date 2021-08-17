public class LookupLocation_CC {
	
    
    public List<Location__c> findLocations {get; set;}
    
    public Location__c location {get; set;}
    
    public LookupLocation_CC() {
        location = new Location__c();
        findLocations = [SELECT Name, Location_Type__c, Address__c FROM Location__c];
    }
    
    public PageReference saveDetails() {
        
        insert location;
        return null;
    }
    
}