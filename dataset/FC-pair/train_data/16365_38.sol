contract c16365{
    /*
     * @dev Submit claim for a range of segments
     * @param _jobId Job identifier
     * @param _segmentRange Range of claimed segments
     * @param _claimRoot Merkle root of transcoded segment proof data for claimed segments
     */
    function claimWork(uint256 _jobId, uint256[2] _segmentRange, bytes32 _claimRoot)
        external
        whenSystemNotPaused
        jobExists(_jobId)
    {
        Job storage job = jobs[_jobId];
        // Job cannot be inactive
        require(jobStatus(_jobId) != JobStatus.Inactive);
        // Segment range must be valid
        require(_segmentRange[1] >= _segmentRange[0]);
        // Caller must be registered transcoder
        require(bondingManager().isRegisteredTranscoder(msg.sender));
        uint256 blockNum = roundsManager().blockNum();
        if (job.transcoderAddress != address(0)) {
            // If transcoder already assigned, check if sender is
            // the assigned transcoder
            require(job.transcoderAddress == msg.sender);
        } else {
            // If transcoder is not already assigned, check if sender should be assigned
            // roundsManager.blockHash() will ensure that the job creation block has been mined and it has not
            // been more than 256 blocks since the creation block
            require(bondingManager().electActiveTranscoder(job.maxPricePerSegment, roundsManager().blockHash(job.creationBlock), job.creationRound) == msg.sender);
            job.transcoderAddress = msg.sender;
        }
        // Move fees from broadcaster deposit to escrow
        uint256 fees = JobLib.calcFees(_segmentRange[1].sub(_segmentRange[0]).add(1), job.transcodingOptions, job.maxPricePerSegment);
        broadcasters[job.broadcasterAddress].deposit = broadcasters[job.broadcasterAddress].deposit.sub(fees);
        job.escrow = job.escrow.add(fees);
        uint256 endVerificationBlock = blockNum.add(verificationPeriod);
        uint256 endVerificationSlashingBlock = endVerificationBlock.add(verificationSlashingPeriod);
        job.claims.push(
            Claim({
                claimId: job.claims.length,
                segmentRange: _segmentRange,
                claimRoot: _claimRoot,
                claimBlock: blockNum,
                endVerificationBlock: endVerificationBlock,
                endVerificationSlashingBlock: endVerificationSlashingBlock,
                status: ClaimStatus.Pending
           })
        );
        NewClaim(job.transcoderAddress, _jobId, job.claims.length - 1);
    }
}