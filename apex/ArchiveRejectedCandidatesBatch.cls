global class ArchiveRejectedCandidatesBatch
implements Database.Batchable<SObject> {

    global Database.QueryLocator start(Database.BatchableContext bc) {

        Date cutoffDate = System.today().addDays(-180);

        return Database.getQueryLocator(
            [
                SELECT Id,
                       Full_Name__c,
                       Candidate_Status__c,
                       Rejection_Date__c,
                       Archived__c
                FROM Candidate__c
                WHERE Candidate_Status__c = 'Rejected'
                AND Rejection_Date__c <= :cutoffDate
                AND Archived__c = false
            ]
        );
    }

    global void execute(Database.BatchableContext bc,
                        List<Candidate__c> scope) {

        for (Candidate__c candidate : scope) {

            candidate.Archived__c = true;

        }

        update scope;
    }

    global void finish(Database.BatchableContext bc) {

        System.debug('Archive Rejected Candidates Batch Completed.');

    }
}
