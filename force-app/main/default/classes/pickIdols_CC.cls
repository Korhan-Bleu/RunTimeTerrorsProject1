public class pickIdols_CC {


    public String selectedIdolId{get; set;}
    public List<Public_Relations__c> prRecords{get; set;}

        
    public List<SelectOption> getIdolNames(){
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('','--Select--'));
        for(Idol__c idol : [SELECT Id,Name from Idol__c]){
            options.add(new SelectOption(idol.Id,idol.Name));
        }
        return options;
    }
    
    public void ShowTable(){
        System.debug('Selected Idol Id -> ' + selectedIdolId);
        prRecords = [SELECT Name, Date__c, Idol__c, Idol_Group__c, Details__c, id FROM Public_Relations__c WHERE Idol__c=:selectedIdolId];

    }
    

    

}