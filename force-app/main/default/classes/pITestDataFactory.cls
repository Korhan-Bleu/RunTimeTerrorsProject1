@isTest
public class pITestDataFactory {
  
    // Create a list of selectoptions with idols
    public static List<SelectOption> createOptionsWithIdols(Integer numIdols){
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('','--Select--'));
        List<Idol__c> idols = new List<Idol__c>();
        
        for(Integer i=0; i<numIdols; i++){
            Idol__c idol = new Idol__c(name='TestIdol' + i, Idol_phone__c = '859786972' + i);
            idols.add(idol);
            
        }
        insert idols;
        
        for(Idol__c idol : [SELECT Id,Name from Idol__c]){
            options.add(new SelectOption(idol.Id,idol.Name));
        }
        
        return options;
        
        
    }
    
    public static List<Public_Relations__c> createPR(Integer num){
        List<Public_Relations__c> prList = new List<Public_Relations__c>();
        
        for(Integer i=0; i<num; i++){
            Public_Relations__c pr = new Public_Relations__c(Name='TestPR' + i);
            prList.add(pr);
        }
        
        insert prList;
        return prList;
    }
    
    // Create bulk create PR Record method that takes in an idol id
    public static List<Public_Relations__c> createPR(Integer num, Id idolId){
        List<Public_Relations__c> prList = new List<Public_Relations__c>();
        
        for(Integer i=0; i<num; i++){
            Public_Relations__c pr = new Public_Relations__c(Name='Test' + i, idol__c=idolId);
            prList.add(pr);
        }
        insert prList;
        System.debug('prList' + prList);
        List<Public_Relations__c> masterPRList = [SELECT Name, Date__c, Idol__c, Idol_Group__c, Details__c, id FROM Public_Relations__c WHERE Idol__c=:idolId];
        System.debug('masterPRList' + masterPRList);
        return masterPRList;
    }
    
    
    // create Idols
    public static List<Idol__c> createIdols(Integer num){
        List<Idol__c> idols = new List<Idol__c>();
        
        for(integer i=0; i<num; i++){
            Idol__c idol = new Idol__c(Name='TestIdol' + i, Idol_phone__c = '859786972' + i);
            idols.add(idol);
        }
        insert idols;
        return idols;
}
    
    

}