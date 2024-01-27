contract c16365{
    // Check if job exists
    modifier jobExists(uint256 _jobId) {
        require(_jobId < numJobs);
        _;
    }
}