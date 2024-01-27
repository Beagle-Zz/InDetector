contract c16365{
    /*
     * @dev Compute the personal segment hash of a segment. Hashes the concatentation of the personal hash prefix and the segment hash
     * @param _streamId Stream identifier
     * @param _segmentSequenceNumber Segment sequence number in stream
     * @param _dataHash Content-addrssed storage hash of segment data
     */
    function personalSegmentHash(string _streamId, uint256 _segmentNumber, bytes32 _dataHash) public pure returns (bytes32) {
        bytes memory prefixBytes = bytes(PERSONAL_HASH_PREFIX);
        return keccak256(prefixBytes, segmentHash(_streamId, _segmentNumber, _dataHash));
    }
}