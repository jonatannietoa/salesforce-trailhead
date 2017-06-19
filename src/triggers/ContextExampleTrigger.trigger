trigger ContextExampleTrigger on Account (before insert, after insert, after delete) {
    if (Trigger.isInsert) {
        if (Trigger.isBefore) {
            // Process before insert
            for(Account a : Trigger.New) {
                if(!String.isBlank(a.Phone)){
                    a.Phone = '(0034) ' + a.Phone;    
                }
            } 
        } else if (Trigger.isAfter) {
            // Process after insert
        }        
    }
    else if (Trigger.isDelete) {
        // Process after delete
    }
}