@isTest
public with sharing class btsControllerTest {


   @isTest static void btsControllerTest() {

     List<Idol__c> var = btsMockData.createIdol(1);
     Idol__c variablename = [SELECT ID FROM Idol__c LIMIT 1];
     ID varID = variablename.ID;



     List<Idol_Group__c> lis = btsMockData.createIdolGroup(1, varID);

     List<Idol__c> expected = [SELECT Name, (SELECT NAME FROM Idol_Groups__r WHERE Name='bts') FROM Idol__c];
     



     Test.startTest();
     btsController bts = new btsController();
     List<Idol__c> actual = bts.btsController();
     Test.stopTest();
     

     System.assertEquals(expected, actual );
      

}

}