contract c16365{
    /*
     * @dev Refund broadcaster for a job
     * @param _jobId Job identifier
     */
    function refundBroadcaster(uint256 _jobId) internal {
        Job storage job = jobs[_jobId];
        // Return all escrowed fees for a job
        uint256 fees = job.escrow;
        job.escrow = job.escrow.sub(fees);
        broadcasters[job.broadcasterAddress].deposit = broadcasters[job.broadcasterAddress].deposit.add(fees);
        // Set end block of job to current block - job becomes inactive
        job.endBlock = roundsManager().blockNum();
    }
}