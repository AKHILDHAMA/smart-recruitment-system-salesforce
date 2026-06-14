public class CandidateTriggerHandler {

    public void beforeInsert(List<Candidate__c> newCandidates) {

        CandidateScoreCalculator.calculateScore(newCandidates);

    }

    public void beforeUpdate(
        List<Candidate__c> newCandidates,
        Map<Id, Candidate__c> oldMap
    ) {

        CandidateScoreCalculator.calculateScore(newCandidates);

    }
}
