contract c16365{
    /*
     * Computes whether a segment is eligible for verification based on the last call to claimWork()
     * @param _segmentNumber Sequence number of segment in stream
     * @param _segmentRange Range of segments claimed
     * @param _challengeBlock Block afer the block when claimWork() was called
     * @param _challengeBlockHash Block hash of challenge block
     * @param _verificationRate Rate at which a particular segment should be verified
     */
    function shouldVerifySegment(
        uint256 _segmentNumber,
        uint256[2] _segmentRange,
        uint256 _challengeBlock,
        bytes32 _challengeBlockHash,
        uint64 _verificationRate
    )
        public
        pure
        returns (bool)
    {
        // Segment must be in segment range
        if (_segmentNumber < _segmentRange[0] || _segmentNumber > _segmentRange[1]) {
            return false;
        }
        // Use block hash and block number of the block after a claim to determine if a segment
        // should be verified
        if (uint256(keccak256(_challengeBlock, _challengeBlockHash, _segmentNumber)) % _verificationRate == 0) {
            return true;
        } else {
            return false;
        }
    }
}