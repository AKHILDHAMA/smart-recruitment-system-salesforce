global class ArchiveRejectedCandidatesScheduler
implements Schedulable {

    global void execute(SchedulableContext sc) {

        ArchiveRejectedCandidatesBatch batch =
            new ArchiveRejectedCandidatesBatch();

        Database.executeBatch(batch, 200);
    }
}
