contract c16365{
    /*
     * @dev Slash transcoder for missing verification
     * @param _jobId Job identifier
     * @param _claimId Claim identifier
     * @param _segmentNumber Segment that was not verified
     */
    function missedVerificationSlash(uint256 _jobId, uint256 _claimId, uint256 _segmentNumber)
        external
        whenSystemNotPaused
        jobExists(_jobId)
    {
        Job storage job = jobs[_jobId];
        Claim storage claim = job.claims[_claimId];
        uint256 blockNum = roundsManager().blockNum();
        uint256 challengeBlock = claim.claimBlock + 1;
        // Must be after verification period
        require(blockNum >= claim.endVerificationBlock);
        // Must be before end of slashing period
        require(blockNum < claim.endVerificationSlashingBlock);
        // Claim must be pending
        require(claim.status == ClaimStatus.Pending);
        // Segment must be eligible for verification
        // roundsManager().blockHash() ensures that the challenge block is within the last 256 blocks from the current block
        require(JobLib.shouldVerifySegment(_segmentNumber, claim.segmentRange, challengeBlock, roundsManager().blockHash(challengeBlock), verificationRate));
        // Transcoder must have missed verification for the segment
        require(!claim.segmentVerifications[_segmentNumber]);
        refundBroadcaster(_jobId);
        // Slash transcoder and provide finder params
        bondingManager().slashTranscoder(job.transcoderAddress, msg.sender, missedVerificationSlashAmount, finderFee);
        // Set claim as slashed
        claim.status = ClaimStatus.Slashed;
    }
}