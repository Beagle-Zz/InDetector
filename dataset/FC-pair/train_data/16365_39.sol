contract c16365{
    /*
     * @dev Submit transcode receipt and invoke transcoding verification
     * @param _jobId Job identifier
     * @param _segmentNumber Segment sequence number in stream
     * @param _dataStorageHash Content-addressed storage hash of segment data
     * @param _dataHashes Hash of segment data and hash of transcoded segment data
     * @param _broadcasterSig Broadcaster's signature over segment hash
     * @param _proof Merkle proof for transcode receipt
     */
    function verify(
        uint256 _jobId,
        uint256 _claimId,
        uint256 _segmentNumber,
        string _dataStorageHash,
        bytes32[2] _dataHashes,
        bytes _broadcasterSig,
        bytes _proof
    )
        external
        payable
        whenSystemNotPaused
        sufficientPayment
        jobExists(_jobId)
    {
        Job storage job = jobs[_jobId];
        Claim storage claim = job.claims[_claimId];
        // Sender must be elected transcoder
        require(job.transcoderAddress == msg.sender);
        uint256 challengeBlock = claim.claimBlock + 1;
        // Segment must be eligible for verification
        // roundsManager().blockHash() ensures that the challenge block is within the last 256 blocks from the current block
        require(JobLib.shouldVerifySegment(_segmentNumber, claim.segmentRange, challengeBlock, roundsManager().blockHash(challengeBlock), verificationRate));
        // Segment must be signed by broadcaster
        require(
            JobLib.validateBroadcasterSig(
                job.streamId,
                _segmentNumber,
                _dataHashes[0],
                _broadcasterSig,
                job.broadcasterAddress
            )
        );
        // Receipt must be valid
        require(
            JobLib.validateReceipt(
                job.streamId,
                _segmentNumber,
                _dataHashes[0],
                _dataHashes[1],
                _broadcasterSig,
                _proof,
                claim.claimRoot
           )
        );
        // Mark segment as submitted for verification
        claim.segmentVerifications[_segmentNumber] = true;
        // Invoke transcoding verification. This is async and will result in a callback to receiveVerification() which is implemented by this contract
        invokeVerification(_jobId, _claimId, _segmentNumber, _dataStorageHash, _dataHashes);
        Verify(msg.sender, _jobId, _claimId, _segmentNumber);
    }
}