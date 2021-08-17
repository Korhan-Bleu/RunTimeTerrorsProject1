@IsTest
public with sharing class newAppointmentExtensionTest {
    @isTest static void AppExtTest(){
        //new dummy controller for the standardcontroler
        Appointment__c app = new Appointment__c();
        //calls the current page
        Test.setCurrentPage(Page.AppPageWiz);
        //creation of standard controller with a dummy 
        Apexpages.StandardController appController = new Apexpages.StandardController(app);
        //get standard controller and pass it through the extension 
        newAppointmentExtension test = new newAppointmentExtension(appController);

        System.Test.startTest();
        test.app.Name = 'test';
        test.app.Client_Name__c = 'testClient';
        test.app.Contact_Email__c = 'testemail@email.com';
        test.app.Contact_Phone_Number__c = '2222222222';
        System.Test.stopTest();

        List <Appointment__c> verifyAppInsert = [SELECT Name FROM Appointment__c WHERE Name = 'test'];

        System.assert(verifyAppInsert != NULL);

    }

     // test for the positive
     @isTest
     static void getAppointmentTest(){
         // Test data setup
         //
         Appointment__c expected = new Appointment__c();
 
 
         Appointment__c ap = new Appointment__c();
         ApexPages.StandardController app = new ApexPages.StandardController(ap);
         // perform test
         // 
         newAppointmentExtension newApp = new newAppointmentExtension(app);
         newApp.app = null;
         Appointment__c actual = newApp.getAppointment();
 
         // Verify
 
         System.assertEquals(expected, actual);
     }
     //test for the negative
     @isTest
     static void getAppointmentTestNegative(){
         // Test data setup
         //
         Appointment__c expected = new Appointment__c(name='test App');
 
         Appointment__c ap = new Appointment__c();
         ApexPages.StandardController app = new ApexPages.StandardController(ap);
         // perform test
         //
         // make a new test to use that is not null
         Appointment__c testAp = new Appointment__c(name='test App'); 
         newAppointmentExtension newApp = new newAppointmentExtension(app);
         newApp.app = testAp;
         Appointment__c actual = newApp.getAppointment();
         System.debug('expected ->' + expected);
         System.debug('actual ->' + actual);
         // Verify
 
         System.assertEquals(expected, actual);
     }
    @isTest
    static void getLogisticTestPositive(){
        //data setup
        Logistic__c expected = new Logistic__c();
        
        Appointment__c ap = new Appointment__c();
        ApexPages.StandardController app = new ApexPages.StandardController(ap);
        // perform test
        newAppointmentExtension newApp = new newAppointmentExtension(app);
        newApp.log = null;
        Logistic__c actual = newApp.getLogistic();
        System.assertEquals(expected, actual);

    }
    @isTest
    static void getLogisticTestNegative(){
        // Test data setup
        Logistic__c expected = new Logistic__c(name='test log');
 
         Appointment__c ap = new Appointment__c();
         ApexPages.StandardController app = new ApexPages.StandardController(ap);
         // perform test
         // make a new test to use that is not null
         Logistic__c testAp = new Logistic__c(name='test log'); 
         newAppointmentExtension newApp = new newAppointmentExtension(app);
         newApp.log = testAp;
         Logistic__c actual = newApp.getLogistic();
         System.debug('expected ->' + expected);
         System.debug('actual ->' + actual);
         // Verify
 
         System.assertEquals(expected, actual);
    }

    @isTest static void VerifyCreate(){
        //dummy idol controller
        Appointment__c logs = new Appointment__c();
        //calls the current page
        Test.setCurrentPage(Page.LogPageWiz);
        //Create a standard controller with the dummy controller
        ApexPages.StandardController logController = new ApexPages.StandardController(logs);
        
        //Get the standard controller and pass it through the controller extension
        newAppointmentExtension test = new newAppointmentExtension(logController);
        
        System.Test.StartTest();
        PageReference testPage = test.logCreation(); 
        System.Test.StopTest();
        
        System.assertEquals('/apex/logpagewiz', testPage.getUrl());
    }
    @isTest static void VerifyAppPage(){
        //dummy idol controller
        Appointment__c app = new Appointment__c();
        //calls the current page
        Test.setCurrentPage(Page.AppPageWiz);
        //Create a standard controller with the dummy controller
        ApexPages.StandardController appController = new ApexPages.StandardController(app);
        
        //Get the standard controller and pass it through the controller extension
        newAppointmentExtension test = new newAppointmentExtension(appController);
        
        System.Test.StartTest();
        PageReference testPage = test.appCreation(); 
        System.Test.StopTest();
        
        System.assertEquals('/apex/apppagewiz', testPage.getUrl());
    }
    @isTest static void VerifyCancel(){
        //dummy idol controller
        Appointment__c app = new Appointment__c();
        //calls the current page
        Test.setCurrentPage(Page.AppPageWiz);
        //Create a standard controller with the dummy controller
        ApexPages.StandardController appController = new ApexPages.StandardController(app);
        
        //Get the standard controller and pass it through the controller extension
        newAppointmentExtension test = new newAppointmentExtension(appController);
        
        System.Test.StartTest();
        PageReference testPage = test.cancel(); 
        System.Test.StopTest();
        
        System.assertEquals('/006', testPage.getUrl());
    }
}