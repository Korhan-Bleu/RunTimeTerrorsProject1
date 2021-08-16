trigger newIdolOrientation ON Idol__c(after insert) {
    List<Appointment__c> idolApp = new List<Appointment__c>();
    Appointment__c A = new Appointment__c();
    Idol__c W = new Idol__c();
    for(Idol__c i: Trigger.new){
        A.RecordTypeId = '0125e000000uscxAAA';
        A.Name = 'Orientation for ' + i.Name;
        idolApp.add(A);
    }
    if(idolApp.size() > 0){
    insert idolApp;
    }
}