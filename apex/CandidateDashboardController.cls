public with sharing class CandidateDashboardController {

    @AuraEnabled(cacheable=true)
    public static List<Candidate__c> getCandidates() {

        return [
            SELECT Id,
                   Full_Name__c,
                   Final_Score__c,
                   Candidate_Status__c
            FROM Candidate__c
            ORDER BY CreatedDate DESC
        ];
    }

    @AuraEnabled(cacheable=true)
public static List<Candidate__c> searchCandidates(String searchKey) {

    return [
        SELECT Id,
               Full_Name__c,
               Final_Score__c,
               Candidate_Status__c
        FROM Candidate__c
        WHERE Full_Name__c LIKE :('%' + searchKey + '%')
        ORDER BY CreatedDate DESC
    ];
}
}
