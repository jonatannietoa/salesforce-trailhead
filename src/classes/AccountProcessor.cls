public with sharing class AccountProcessor {
    @future(callout=true)
    public static void countContacts(List<String> accountIds){
        List<Account> accounts = [SELECT Id, Number_of_Contacts__c, (SELECT Id FROM Contacts)
                                    FROM Account
                                    WHERE Account.Id IN :accountIds];
        for (Account account : accounts) {
            account.Number_of_Contacts__c = account.Contacts.size();
        }
        upsert accounts;
        System.debug('"Number of Contacts" Field of ' + accounts.size() + ' accounts have updated.');
    }
}