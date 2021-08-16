@IsTest
public with sharing class newAppointmentExtensionTest {
    @isTest static void AppExtTest(){
        //new dummy controller for the standardcontroler
        Appointment__c app = new Appointment__c();
        //calls the current page
        Test.setCurrentPage(AppPageWiz);
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

        Appointment__c verifyAppInsert = [SELECT Name FROM Appointment__c WHERE Name = 'test'];

        System.assertEquals(verifyAppInsert != NULL);

    }

     // test for the positive
     @isTest
     static void getAppointmentTest(){
         // Test data setup
         //
         Appointmentc expected = new Appointmentc();
 
 
         Appointmentc ap = new Appointmentc();
         ApexPages.StandardController app = new ApexPages.StandardController(ap);
         // perform test
         // 
         newAppointmentExtension newApp = new newAppointmentExtension(app);
         newApp.app = null;
         Appointmentc actual = newApp.getAppointment();
 
         // Verify
 
         System.assertEquals(expected, actual);
     }
     //test for the negative
         @isTest
     static void getAppointmentTestNegative(){
         // Test data setup
         //
         Appointmentc expected = new Appointmentc(name='test App');
 
         Appointmentc ap = new Appointmentc();
         ApexPages.StandardController app = new ApexPages.StandardController(ap);
         // perform test
         //
         // make a new test to use that is not null
         Appointmentc testAp = new Appointmentc(name='test App'); 
         newAppointmentExtension newApp = new newAppointmentExtension(app);
         newApp.app = testAp;
         Appointmentc actual = newApp.getAppointment();
         System.debug('expected ->' + expected);
         System.debug('actual ->' + actual);
         // Verify
 
         System.assertEquals(expected, actual);
     }
}