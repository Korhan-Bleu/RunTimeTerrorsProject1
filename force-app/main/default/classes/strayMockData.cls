@isTest
public with sharing class strayMockData {
   
   public static List <Idol__c> createIdol(Integer num) {

    List<Idol__c> idolList = new List<Idol__c>();
    for (Integer i = 0; i < num; i++) {
        Idol__c idol = new Idol__c(name='test' + i, Idol_phone__c = '5555555555' + 1);
        idolList.add(idol);
    }

    insert idolList;
    
    return idolList;

    }

    public static List <Idol_Group__c> createIdolGroup(Integer num, Id idolId) {

    List<Idol_Group__c> groupList = new List<Idol_Group__c>();
    for (Integer i = 0; i < num; i++) {
        Idol_Group__c grup = new Idol_Group__c(name='stray', Lead__c = idolId, Vocals__c=idolId);
        groupList.add(grup);

    }

    insert groupList;
    return groupList;



}
}