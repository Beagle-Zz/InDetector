contract c16365{
    /*
     * @dev Checks if a transcode receipt hash was included in a committed merkle root
     * @param _streamId StreamID for the segment
     * @param _segmentNumber Sequence number of segment in the stream
     * @param _dataHash Hash of segment data
     * @param _transcodedDataHash Hash of transcoded segment data
     * @param _broadcasterSig Broadcaster signature over h(streamId, segmentNumber, dataHash)
     * @param _broadcaster Broadcaster address
     */
    function validateReceipt(
        string _streamId,
        uint256 _segmentNumber,
        bytes32 _dataHash,
        bytes32 _transcodedDataHash,
        bytes _broadcasterSig,
        bytes _proof,
        bytes32 _claimRoot
    )
        public
        pure
        returns (bool)
    {
        return MerkleProof.verifyProof(_proof, _claimRoot, transcodeReceiptHash(_streamId, _segmentNumber, _dataHash, _transcodedDataHash, _broadcasterSig));
    }
}