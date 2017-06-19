@isTest
private class AccountProcessorTest {
    public static testMethod void testRefreshNumberOfContactsOfAccounts() {
        List<String> idsAccount = new List<String>();
        Account account = new Account(Name='Test Account APT', Number_of_Contacts__c=0);
        insert account;

        Contact contact = new Contact(FirstName='Test Contact', LastName='New', AccountId=account.Id);
        insert contact;

        idsAccount.add(account.Id);

        Test.startTest();
            AccountProcessor.countContacts(idsAccount);
        Test.stopTest();

        account = [SELECT Id, Number_of_Contacts__c FROM Account WHERE Id =: account.Id];
        System.assertEquals(1, account.Number_of_Contacts__c);
    }
}