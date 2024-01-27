contract c40081{
     
    function getRevisionBlockNumber(bytes20 blobId, uint revisionId) external constant revisionExists(blobId, revisionId) returns (uint blockNumber) {
        blockNumber = _getRevisionBlockNumber(blobId, revisionId);
    }
}