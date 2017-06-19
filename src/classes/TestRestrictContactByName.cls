@isTest
public class TestRestrictContactByName {
	static testMethod void testRestrictContactByNameForInvalidName(){
        Contact c = new Contact(FirstName='Jonatan', LastName='INVALIDNAME');
        try {
        	insert c;    
        } catch(Exception e) {
            System.Assert(e.getMessage().contains('INVALIDNAME'));
        }
    }
    
    static testMethod void testRestrictContactByNameForValidName(){
        Contact c = new Contact(FirstName='Jonatan', LastName='Nieto');
        insert c;
    }
}