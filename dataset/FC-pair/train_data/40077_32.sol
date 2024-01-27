contract c40077{
     
    function _getRevisionBlockNumber(bytes20 blobId, uint revisionId) internal returns (uint blockNumber) {
        if (revisionId == 0) {
            blockNumber = blobInfo[blobId].blockNumber;
        }
        else {
            bytes32 slot = packedBlockNumbers[blobId][(revisionId - 1) / 8];
            blockNumber = uint32(uint256(slot) / 2**(((revisionId - 1) % 8) * 32));
        }
    }
}