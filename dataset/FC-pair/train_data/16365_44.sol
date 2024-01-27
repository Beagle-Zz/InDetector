contract c16365{
    /*
     * @dev Slash transcoder for claiming a segment twice
     * @param _jobId Job identifier
     * @param _claimId1 Claim 1 identifier
     * @param _claimId2 Claim 2 identifier
     * @param _segmentNumber Segment that was claimed twice
     */
    function doubleClaimSegmentSlash(
        uint256 _jobId,
        uint256 _claimId1,
        uint256 _claimId2,
        uint256 _segmentNumber
    )
        external
        whenSystemNotPaused
        jobExists(_jobId)
    {
        Job storage job = jobs[_jobId];
        Claim storage claim1 = job.claims[_claimId1];
        Claim storage claim2 = job.claims[_claimId2];
        // Claim 1 must not be slashed
        require(claim1.status != ClaimStatus.Slashed);
        // Claim 2 must not be slashed
        require(claim2.status != ClaimStatus.Slashed);
        // Segment must be in claim 1 segment range
        require(_segmentNumber >= claim1.segmentRange[0] && _segmentNumber <= claim1.segmentRange[1]);
        // Segment must be in claim 2 segment range
        require(_segmentNumber >= claim2.segmentRange[0] && _segmentNumber <= claim2.segmentRange[1]);
        // Slash transcoder and provide finder params
        bondingManager().slashTranscoder(job.transcoderAddress, msg.sender, doubleClaimSegmentSlashAmount, finderFee);
        refundBroadcaster(_jobId);
        // Set claim 1 as slashed
        claim1.status = ClaimStatus.Slashed;
        // Set claim 2 as slashed
        claim2.status = ClaimStatus.Slashed;
    }
}