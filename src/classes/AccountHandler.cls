public class AccountHandler {
    public static Account insertNewAccount(String accountName){
        try{
            Account acct = new Account(Name=accountName);
			insert acct;
            return acct;
        }catch(Exception e){
            return null;
        }
    }
}