contract c16368{
    /*
     * Compute the hash of a segment
     * @param _streamId Stream identifier
     * @param _segmentSequenceNumber Segment sequence number in stream
     * @param _dataHash Content-addressed storage hash of segment data
     */
    function segmentHash(string _streamId, uint256 _segmentNumber, bytes32 _dataHash) public pure returns (bytes32) {
        return keccak256(_streamId, _segmentNumber, _dataHash);
    }
}