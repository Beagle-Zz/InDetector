contract c16365{
    /*
     * @dev Checks if a segment was signed by a broadcaster address
     * @param _streamId Stream ID for the segment
     * @param _segmentNumber Sequence number of segment in the stream
     * @param _dataHash Hash of segment data
     * @param _broadcasterSig Broadcaster signature over h(streamId, segmentNumber, dataHash)
     * @param _broadcaster Broadcaster address
     */
    function validateBroadcasterSig(
        string _streamId,
        uint256 _segmentNumber,
        bytes32 _dataHash,
        bytes _broadcasterSig,
        address _broadcaster
    )
        public
        pure
        returns (bool)
    {
        return ECRecovery.recover(personalSegmentHash(_streamId, _segmentNumber, _dataHash), _broadcasterSig) == _broadcaster;
    }
}