contract c40081{
     
    function _getAllRevisionBlockNumbers(bytes20 blobId) internal returns (uint[] blockNumbers) {
        uint revisionCount = blobInfo[blobId].revisionCount;
        blockNumbers = new uint[](revisionCount);
        for (uint revisionId = 0; revisionId < revisionCount; revisionId++) {
            blockNumbers[revisionId] = _getRevisionBlockNumber(blobId, revisionId);
        }
    }
}