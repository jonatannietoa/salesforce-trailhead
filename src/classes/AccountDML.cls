public class AccountDML {
    
    public static void insertAccount(){
        // Create the account sObject 
		Account acct = new Account(Name='Acme', Phone='(415)555-1212', NumberOfEmployees=100);
		// Insert the account by using DML
		insert acct;
    }
}