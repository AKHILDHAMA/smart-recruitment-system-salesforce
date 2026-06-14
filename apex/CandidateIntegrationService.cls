public with sharing class CandidateIntegrationService {

    public static void updateCandidateData(Id candidateId) {

        Http http = new Http();

        HttpRequest request = new HttpRequest();

        request.setEndpoint(
            'https://jsonplaceholder.typicode.com/users/1'
        );

        request.setMethod('GET');

        HttpResponse response = http.send(request);

        System.debug(
            'Status Code: ' + response.getStatusCode()
        );

        if (response.getStatusCode() == 200) {

            Map<String, Object> responseMap =
                (Map<String, Object>)
                JSON.deserializeUntyped(
                    response.getBody()
                );

            String name =
                (String) responseMap.get('name');

            String email =
                (String) responseMap.get('email');

           String phone =
    (String) responseMap.get('phone');

phone = phone.replaceAll('[^0-9]', '');

if (phone.length() > 10) {

    phone = phone.substring(
        phone.length() - 10
    );

}

            Candidate__c candidate = [
                SELECT Id,
                       Full_Name__c,
                       Email__c,
                       Phone__c
                FROM Candidate__c
                WHERE Id = :candidateId
                LIMIT 1
            ];

            candidate.Full_Name__c = name;
            candidate.Email__c = email;
            candidate.Phone__c = phone;

            update candidate;

            System.debug(
                'Candidate Updated Successfully'
            );
        }
    }
}
