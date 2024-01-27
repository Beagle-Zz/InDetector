contract c16365{
    /*
     * @dev Distribute fees for a particular claim
     * @param _jobId Job identifier
     * @param _claimId Claim identifier
     */
    function distributeFees(uint256 _jobId, uint256 _claimId)
        public
        whenSystemNotPaused
        jobExists(_jobId)
    {
        Job storage job = jobs[_jobId];
        Claim storage claim = job.claims[_claimId];
        // Sender must be elected transcoder for job
        require(job.transcoderAddress == msg.sender);
        // Claim must not be complete
        require(claim.status == ClaimStatus.Pending);
        // Slashing period must be over for claim
        require(claim.endVerificationSlashingBlock <= roundsManager().blockNum());
        uint256 fees = JobLib.calcFees(claim.segmentRange[1].sub(claim.segmentRange[0]).add(1), job.transcodingOptions, job.maxPricePerSegment);
        // Deduct fees from escrow
        job.escrow = job.escrow.sub(fees);
        // Add fees to transcoder's fee pool
        bondingManager().updateTranscoderWithFees(msg.sender, fees, job.creationRound);
        // Set claim as complete
        claim.status = ClaimStatus.Complete;
        DistributeFees(msg.sender, _jobId, _claimId, fees);
    }
}