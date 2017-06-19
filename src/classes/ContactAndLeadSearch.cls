public class ContactAndLeadSearch {
    public static List<List< SObject>> searchContactsAndLeads(String lastName){
        List<List<SObject>> contacts = new List<List<SObject>>();
        contacts = [FIND :lastName IN NAME FIELDS 
                   						RETURNING Contact(Name),Lead(Name)];
        
        return contacts;
    }
}