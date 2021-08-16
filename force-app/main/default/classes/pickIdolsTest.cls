@isTest
private class pickIdolsTest {
    
    // test for single record - getIdolNames
    @isTest
    static void getIdolNamesWithOneRecord(){
        // Test data setup
        List<SelectOption> options = pITestDataFactory.createOptionsWithIdols(1);
        
        // Perform Test
        Test.startTest();
        pickIdols_CC pickIdols = new pickIdols_CC();
        List<SelectOption> optionList = pickIdols.getIdolNames();
        Test.stopTest();
        
        
        
        // Verify the test
        System.assertEquals(options, optionList );
    }
    
    
    
    // test for bulk records - getIdolNames
    @isTest
    static void getIdolNamesWithBulkRecords(){
        // Test data setup
        List<SelectOption> options = pITestDataFactory.createOptionsWithIdols(200);
        
        // Perform Test
        Test.startTest();
        pickIdols_CC pickIdols = new pickIdols_CC();
        List<SelectOption> optionList = pickIdols.getIdolNames();
        Test.stopTest();
        
        
        
        // Verify the test
        System.assertEquals(options, optionList );
    }
    
    
    
    // test for single record - showTable
    @isTest
    static void showTableWIthOneRecord(){
        //Test Data Setup
        List<Idol__c> idols = pITestDataFactory.createIdols(1);
        Idol__c idolId = [SELECT id FROM Idol__C Limit 1];
        Id idolIID = idolId.Id;
        String idolIdString = String.valueOf(idolIID);


        List<Public_Relations__c> prExpected = pITestDataFactory.createPR(1, idolIId);
        //List<Public_Relations__c> pr = [SELECT Name FROM Public_Relations__c];

        
        
        // Perform Test
        
        Test.startTest();
        
        pickIdols_CC pickIdols = new pickIdols_CC();
        pickIdols.selectedIdolId = idolIdString;
        pickIdols.ShowTable();
        List<Public_Relations__c> prActual = pickIdols.prRecords;
        Test.stopTest();
        
        
        //Verify Test
        System.debug('expected' + prExpected);
        System.debug('actual' + prActual);
 
        System.assertEquals(prExpected, prActual);
        
        
    }
    
    
    
    // test for bulk - showTable
    @isTest
    static void showTableWIthBulkRecord(){
        //Test Data Setup
        List<Idol__c> idols = pITestDataFactory.createIdols(200);
        Idol__c idolId = [SELECT id FROM Idol__C Limit 1];
        Id idolIID = idolId.Id;
        String idolIdString = String.valueOf(idolIID);


        List<Public_Relations__c> prExpected = pITestDataFactory.createPR(200, idolIId);
        //List<Public_Relations__c> pr = [SELECT Name FROM Public_Relations__c];

        
        
        // Perform Test
        
        Test.startTest();
        
        pickIdols_CC pickIdols = new pickIdols_CC();
        pickIdols.selectedIdolId = idolIdString;
        pickIdols.ShowTable();
        List<Public_Relations__c> prActual = pickIdols.prRecords;
        Test.stopTest();
        
        
        //Verify Test
        System.debug('expected' + prExpected);
        System.debug('actual' + prActual);
 
        System.assertEquals(prExpected, prActual);
        
    }
    
    
}