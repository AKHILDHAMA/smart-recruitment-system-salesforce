public class CandidateScoreCalculator {

    public static void calculateScore(List<Candidate__c> candidates) {

        for (Candidate__c candidate : candidates) {

            Decimal experience = candidate.Experience_Years__c == null ? 0 : candidate.Experience_Years__c;
            Decimal skills = candidate.Skills_Rating__c == null ? 0 : candidate.Skills_Rating__c;
            Decimal interview = candidate.Interview_Rating__c == null ? 0 : candidate.Interview_Rating__c;

            Decimal finalScore =
                (experience * 0.4) +
                (skills * 0.3) +
                (interview * 0.3);

            candidate.Final_Score__c = finalScore;
        }
    }
}
