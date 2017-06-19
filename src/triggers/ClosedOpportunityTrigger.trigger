trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Task> tasks = new List<Task>();
    
    for(Opportunity o : [SELECT Id, StageName FROM Opportunity WHERE Id IN :Trigger.New]) {
        if(o.StageName.equals('Closed Won')){
            Task task = new Task(Subject='Follow Up Test Task', WhatId=o.Id);
            tasks.add(task);
            //WARNING, if used insert inside loop, DML Exception is throwed when we have a lot of data.
            //insert tasks;
        }
    }
 
    insert tasks;
}