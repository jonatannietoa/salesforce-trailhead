public class ContactSearch {
    public static List<Contact> searchForContacts(String lastName, String postalCode){
        List<Contact> contacts = new List<Contact>();
        
        contacts = [SELECT ID, Name
                    FROM Contact
                    WHERE LastName =: lastName AND MailingPostalCode =: postalCode];
        
        return contacts;
    }
}