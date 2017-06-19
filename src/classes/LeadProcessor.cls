global class LeadProcessor implements Database.Batchable<sObject> {
    global Integer recordsProcessed = 0;

    global Database.QueryLocator start(Database.BatchableContext bc) {
        // collect the batches of records or objects to be passed to execute
        return Database.getQueryLocator('SELECT Id, Name FROM Lead');
    }

    global void execute(Database.BatchableContext bc, List<Lead> records){
        List<Lead> leads = new List<Lead>();
        // process each batch of records
        for (Lead lead : records) {
            lead.LeadSource = 'Dreamforce';
            leads.add(lead);
            recordsProcessed++;
        }
        update leads;
    }

    global void finish(Database.BatchableContext bc){
        // execute any post-processing operations
        System.debug(recordsProcessed + ' records processed. Shazam!');
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors,
                JobItemsProcessed,
                TotalJobItems, CreatedBy.Email
        FROM AsyncApexJob
        WHERE Id = :bc.getJobId()];
    }

}