# Smart Recruitment System Architecture

## Recruitment Process Flow

Candidate
↓
Application
↓
Interview
↓
Interview Feedback
↓
Offer
↓
Onboarding

## Key Automations

1. Auto Create Interview

   * Triggered when Application Stage changes to Technical Interview.

2. Update Application Based on Feedback

   * Proceed → HR Interview
   * Reject → Rejected

3. Update Candidate Based on Offer

   * Accepted → Hired
   * Rejected → Rejected

4. Create Onboarding on Offer Acceptance

   * Automatically creates an Onboarding record.

## Technical Components

* Custom Objects
* Record-Triggered Flows
* Apex Classes
* Queueable Apex
* Batch Apex
* Scheduled Apex
* REST API Integration
* Lightning Web Components (LWC)
* Reports and Dashboards

