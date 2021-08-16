public with sharing class IdolControllerExtension {
    
    Idol__c idol;
    public IdolControllerExtension(ApexPages.StandardController controller){
        this.idol = (Idol__c) controller.getRecord();
    }


    private String sortOrder = 'Name';
    
    public List<Idol__c> getIdols() {
        String retrieveFields = 'Name, Id, Idol_Phone__c, Assigned_Location__c, Date_recruited__c, Idol_Pay__c';
        String fieldLocation = 'Idol__c';
        List<Idol__c> idols = Database.query('SELECT '+ retrieveFields +
                                                ' FROM ' + fieldLocation +
                                                ' ORDER BY '+ sortOrder+ ' ASC');
        
        return idols;
    }

    public void sortByDateRecruited(){
        this.sortOrder = 'Date_recruited__c';
    }
    public void sortName(){
        this.sortOrder = 'Name';
    }
    public void sortAssignedLocation(){
        this.sortOrder = 'Assigned_Location__c';
    }
    public void sortIdolPay() {
        this.sortOrder = 'Idol_Pay__c';
    }

    public PageReference Create(){
        PageReference page = new PageReference('/apex/CreatedIdolPage');
        page.setRedirect(true);
        return page;
    }
    public PageReference Back(){
        PageReference page = new PageReference('/apex/IdolVisualForcePage');
        page.setRedirect(true);
        return page;
    }
    public PageReference SaveMessage(){
        insert idol; 
        PageReference page = new PageReference('/apex/IdolCreatedMessage');
        page.setRedirect(true);
        return page;
    }
    
}