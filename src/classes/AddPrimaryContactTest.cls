@IsTest
public with sharing class AddPrimaryContactTest {
    @testSetup
    static void setup() {
        List<Account> accounts = new List<Account>();
        // add 50 child accounts NY
        for (Integer i = 0; i < 50; i++) {
            accounts.add(new Account(Name='Test Account '+i, BillingState='NY'));
        }
        // add 50 child accounts CA
        for (Integer i = 0; i < 50; i++) {
            accounts.add(new Account(Name='Test Account'+i,  BillingState='CA'));
        }
        insert accounts;
    }

    static testmethod void testQueueable() {
        Contact contact = new Contact(FirstName='Jonatan', LastName='Nieto');
        // Create our Queueable instance
        AddPrimaryContact addPrimaryContact = new AddPrimaryContact(contact, 'CA');
        // startTest/stopTest block to force async processes to run
        Test.startTest();
        System.enqueueJob(addPrimaryContact);
        Test.stopTest();
        // Validate the job ran. Check if record have correct parentId now
        System.assertEquals(50, [SELECT count() FROM Account WHERE BillingState = 'CA']);
    }
}