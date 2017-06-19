@IsTest
public with sharing class DailyLeadProcessorTest {
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';

    static testmethod void testScheduledJob() {
        // Create some out of date Opportunity records
        List<Lead> leads = new List<Lead>();
        for (Integer i=0; i<200; i++) {
            Lead lead = new Lead(FirstName='Lead ', LastName='n ' + i, Company='Sage');
            leads.add(lead);
        }
        insert leads;

        Test.startTest();
        // Schedule the test job
        String jobId = System.schedule('ScheduledApexTest', CRON_EXP, new DailyLeadProcessor());
        // Stopping the test will run the job synchronously
        Test.stopTest();

        System.assertEquals(200, [SELECT COUNT() FROM Lead WHERE LeadSource LIKE 'Dreamforce']);
    }
}