# End-to-End Testing

## Test Case 1: Candidate Creation

* Candidate record created successfully.
* Candidate Number generated automatically.

## Test Case 2: Application Creation

* Application linked to Candidate.
* Application Stage initialized correctly.

## Test Case 3: Interview Automation

* Interview record created automatically when Application Stage changed to Technical Interview.

## Test Case 4: Interview Feedback Automation

* Recommendation = Proceed → Application Stage updated to HR Interview.
* Recommendation = Reject → Application Stage updated to Rejected.

## Test Case 5: Offer Management

* Offer Status = Accepted → Candidate Status updated to Hired.
* Offer Status = Rejected → Candidate Status updated to Rejected.

## Test Case 6: Onboarding Automation

* Onboarding record created automatically upon Offer acceptance.
* Candidate, Offer, Joining Date, and default statuses populated.

## Test Case 7: REST API Integration

* HTTP Status Code 200 received successfully.
* JSON response parsed successfully.
* Candidate details updated.

## Test Case 8: LWC Dashboard Testing

* Candidate Dashboard displayed correctly.
* Search functionality worked successfully.
* Sorting functionality worked successfully.
* Navigation and toast messages worked successfully.

## Test Case 9: Reports Testing

* Candidate Pipeline Report generated successfully.
* Interview Status Report generated successfully.
* Offer Status Report generated successfully.
* Onboarding Status Report generated successfully.

## Test Case 10: Dashboard Testing

* Recruitment Dashboard displayed all components successfully.

