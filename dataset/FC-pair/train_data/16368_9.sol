contract c16368{
    /*
     * Compute the hash of a transcode receipt
     * @param _streamId Stream identifier
     * @param _segmentSequenceNumber Segment sequence number in stream
     * @param _dataHash Content-addressed storage hash of segment data
     * @param _transcodedDataHash Content-addressed storage hash of transcoded segment data
     * @param _broadcasterSig Broadcaster's signature over segment
     */
    function transcodeReceiptHash(
        string _streamId,
        uint256 _segmentNumber,
        bytes32 _dataHash,
        bytes32 _transcodedDataHash,
        bytes _broadcasterSig
    )
        public
        pure
        returns (bytes32)
    {
        return keccak256(_streamId, _segmentNumber, _dataHash, _transcodedDataHash, _broadcasterSig);
    }
}