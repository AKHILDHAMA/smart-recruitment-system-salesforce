import { LightningElement, wire } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import getCandidates from '@salesforce/apex/CandidateDashboardController.getCandidates';
import searchCandidates from '@salesforce/apex/CandidateDashboardController.searchCandidates';

const COLUMNS = [
    {
        label: 'Candidate Name',
        fieldName: 'candidateUrl',
        type: 'url',
        sortable: true,
        typeAttributes: {
            label: { fieldName: 'Full_Name__c' },
            target: '_blank'
        }
    },
    {
        label: 'Final Score',
        fieldName: 'Final_Score__c',
        type: 'number',
        sortable: true
    },
    {
        label: 'Status',
        fieldName: 'Candidate_Status__c',
        sortable: true
    }
];
export default class CandidateDashboard extends NavigationMixin(LightningElement) {

    sortedBy;
    sortDirection = 'asc';
    candidates;
    error;
    searchKey = '';

    columns = COLUMNS;

    @wire(getCandidates)
    wiredCandidates({ error, data }) {

        if (data) {

            this.candidates = this.prepareData(data);

        } else if (error) {

            this.error = error;

        }
    }

    prepareData(data) {

        return data.map(row => {

            return {
                ...row,
                candidateUrl: '/' + row.Id
            };

        });
    }

    handleSearchChange(event) {

        this.searchKey = event.target.value;

    }

    handleSearch() {

        searchCandidates({ searchKey: this.searchKey })

            .then(result => {

                this.candidates = this.prepareData(result);

                if (result.length > 0) {

                    this.dispatchEvent(
                        new ShowToastEvent({
                            title: 'Success',
                            message: 'Search completed successfully.',
                            variant: 'success'
                        })
                    );

                } else {

                    this.dispatchEvent(
                        new ShowToastEvent({
                            title: 'No Records',
                            message: 'No candidates found.',
                            variant: 'warning'
                        })
                    );

                }

            })

            .catch(error => {

                this.error = error;

                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error',
                        message: 'Error searching candidates.',
                        variant: 'error'
                    })
                );

            });
    }

    handleSort(event) {

        const { fieldName, sortDirection } = event.detail;

        this.sortedBy = fieldName;
        this.sortDirection = sortDirection;

        let cloneData = [...this.candidates];

        cloneData.sort((a, b) => {

            let valueA;
            let valueB;

            if (fieldName === 'candidateUrl') {

                valueA = a.Full_Name__c || '';
                valueB = b.Full_Name__c || '';

            } else {

                valueA = a[fieldName] || '';
                valueB = b[fieldName] || '';

            }

            return sortDirection === 'asc'
                ? (valueA > valueB ? 1 : -1)
                : (valueA < valueB ? 1 : -1);

        });

        this.candidates = cloneData;
    }
}