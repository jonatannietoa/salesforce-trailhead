trigger ExampleTrigger on Contact (after insert, after delete) {
    if (Trigger.isInsert) {
        Integer recordCount = Trigger.New.size();
        // Call a utility method from another class
        EmailManager.sendMail('jonatannietoa@gmail.com', 'Contact(s) were inserted', 
                    recordCount + ' contact(s) were inserted.');
    }
    else if (Trigger.isDelete) {
        Integer recordCount = Trigger.Old.size();
        // Process after delete
        EmailManager.sendMail('jonatannietoa@gmail.com', 'WARNING, contact(s) were deleted', 
                    recordCount + ' contact(s) were deleted.');
    }
}