contract c16365{
    /*
     * @dev Callback function that receives the results of transcoding verification
     * @param _jobId Job identifier
     * @param _segmentNumber Segment being verified for job
     * @param _result Boolean result of whether verification succeeded or not
     */
    function receiveVerification(uint256 _jobId, uint256 _claimId, uint256 _segmentNumber, bool _result)
        external
        whenSystemNotPaused
        onlyVerifier
        jobExists(_jobId)
    {
        Job storage job = jobs[_jobId];
        Claim storage claim = job.claims[_claimId];
        // Claim must not be slashed
        require(claim.status != ClaimStatus.Slashed);
        // Segment must have been submitted for verification
        require(claim.segmentVerifications[_segmentNumber]);
        address transcoder = job.transcoderAddress;
        if (!_result) {
            // Refund broadcaster
            refundBroadcaster(_jobId);
            // Set claim as slashed
            claim.status = ClaimStatus.Slashed;
            // Protocol slashes transcoder for failing verification (no finder)
            bondingManager().slashTranscoder(transcoder, address(0), failedVerificationSlashAmount, 0);
            FailedVerification(transcoder, _jobId, _claimId, _segmentNumber);
        } else {
            PassedVerification(transcoder, _jobId, _claimId, _segmentNumber);
        }
    }
}