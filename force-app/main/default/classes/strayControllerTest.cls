@isTest
public with sharing class strayControllerTest {


   @isTest static void strayControllerTest() {

     List<Idol__c> var = strayMockData.createIdol(1);
     Idol__c variablename = [SELECT ID FROM Idol__c LIMIT 1];
     ID varID = variablename.ID;



     List<Idol_Group__c> lis = strayMockData.createIdolGroup(1, varID);

     List<Idol__c> expected = [SELECT Name, (SELECT NAME FROM Idol_Groups__r WHERE Name='stray') FROM Idol__c];
     



     Test.startTest();
     strayController stray = new strayController();
     List<Idol__c> actual = stray.strayController();
     Test.stopTest();
     

     System.assertEquals(expected, actual );
      

}

}