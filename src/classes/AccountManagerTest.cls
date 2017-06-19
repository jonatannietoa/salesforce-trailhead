@IsTest
private class AccountManagerTest {
    @isTest static void testGetAccountById() {
        Id recordId = createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri = '/services/apexrest/Accounts/' + recordId + '/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account thisAccount = AccountManager.getAccount();
        // Verify results
        System.assert(thisAccount != null);
        System.assertEquals('New Account', thisAccount.Name);
        System.assertEquals('Name 1 Last 1', thisAccount.Contacts.get(0).Name);
        System.assertEquals('Name 2 Last 2', thisAccount.Contacts.get(1).Name);
    }

    // Helper method
    static Id createTestRecord() {
        // Create test record
        Account AccountTest = new Account(Name='New Account');
        insert AccountTest;
        List<Contact> contacts = new List<Contact>();
        contacts.add(new Contact(FirstName='Name 1', LastName='Last 1', AccountId=AccountTest.Id));
        contacts.add(new Contact(FirstName='Name 2', LastName='Last 2', AccountId=AccountTest.Id));
        insert contacts;
        return AccountTest.Id;
    }
}