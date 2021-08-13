public class pickIdols_CC {
  //   List<idol__c> idols = [SELECT Name FROM Idol__c];
  /**  
    public List<idol__c> getIdols(){
        List<SelectOption> options = new List<SelectOption>();
        for(Idol__c idol : idols){
            
            options.add(new SelectOption(idol));
                
                }
        return options;
        
    }

*/
      public List<idol__c> idols {get; set;}
    
    
    public List<idol__c> getIdols(){
        List<idol__c> idols = new List<idol__c>();
        for(idol__c idol : [SELECT Name From Idol__c]){
            idols.add(idol);
        }
        return idols;
    }
    
    
    
}