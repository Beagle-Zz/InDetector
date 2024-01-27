contract c16365{
    /*
     * @dev Compute status of job
     * @param _jobId Job identifier
     */
    function jobStatus(uint256 _jobId) public view returns (JobStatus) {
        if (jobs[_jobId].endBlock <= roundsManager().blockNum()) {
            // A job is inactive if the current block is greater than or equal to the job's end block
            return JobStatus.Inactive;
        } else {
            // A job is active if the current block is less than the job's end block
            return JobStatus.Active;
        }
    }
}