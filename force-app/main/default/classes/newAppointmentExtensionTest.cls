@isTest
private class newAppointmentExtensionTest{

    @IsTest 
    static void testGetAppointment() {
        Appointment__c testApp;
        
        test.startTest();
        getAppointment();
    
        test.stopTest();
        System.assertEquals(app, testApp);
        
    }


}