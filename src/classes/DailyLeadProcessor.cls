global class DailyLeadProcessor implements Schedulable {
    global void execute(SchedulableContext ctx) {
        List<Lead> leads = [SELECT Id, Name, LeadSource FROM Lead WHERE LeadSource = NULL LIMIT 200];

        for (Lead lead : leads) {
            lead.LeadSource = 'Dreamforce';
        }
        upsert leads;
    }
}