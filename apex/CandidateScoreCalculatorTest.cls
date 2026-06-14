@isTest
public class CandidateScoreCalculatorTest {

    @isTest
    static void testCandidateScoreCalculation() {

       Candidate__c candidate = new Candidate__c(
    Full_Name__c = 'Test Candidate',
    Phone__c = '9876543210',
    Experience_Years__c = 3,
    Skills_Rating__c = 80,
    Interview_Rating__c = 90
);

        Test.startTest();

        insert candidate;

        Test.stopTest();

        Candidate__c insertedCandidate = [
            SELECT Final_Score__c
            FROM Candidate__c
            WHERE Id = :candidate.Id
        ];

       Decimal expectedScore = 52.20;

        System.assertEquals(
            expectedScore,
            insertedCandidate.Final_Score__c,
            'Final Score should be calculated correctly.'
        );
    }
}
