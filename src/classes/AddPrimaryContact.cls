public with sharing class AddPrimaryContact implements Queueable{
    private Contact contact;
    private String stateAbbr;

    public AddPrimaryContact(Contact contact, String stateAbbr) {
        this.contact = contact;
        this.stateAbbr = stateAbbr;
    }

    public void execute(QueueableContext context) {
        List<Account> accounts = [SELECT Id FROM Account WHERE Account.BillingState LIKE :stateAbbr];
        List<Contact> contacts = new List<Contact>();
        for (Account account : accounts) {
            Contact newContact = contact.clone();
            newContact.AccountId = account.Id;
            contacts.add(newContact);
        }
        insert contacts;
    }
}