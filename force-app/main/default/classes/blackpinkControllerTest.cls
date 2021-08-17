@isTest
public with sharing class blackpinkControllerTest {


   @isTest static void blackpinkControllerTest() {

     List<Idol__c> var = blackpinkMockData.createIdol(1);
     Idol__c variablename = [SELECT ID FROM Idol__c LIMIT 1];
     ID varID = variablename.ID;



     List<Idol_Group__c> lis = blackpinkMockData.createIdolGroup(1, varID);

     List<Idol__c> expected = [SELECT Name, (SELECT NAME FROM Idol_Groups__r WHERE Name='black') FROM Idol__c];
     



     Test.startTest();
     blackpinkController bp = new blackpinkController();
     List<Idol__c> actual = bp.blackpinkController();
     Test.stopTest();
     

     System.assertEquals(expected, actual );
      

}

}