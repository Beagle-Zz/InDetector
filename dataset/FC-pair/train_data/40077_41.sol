contract c40077{
     
    function getRevisionCount(bytes20 blobId) external constant exists(blobId) returns (uint revisionCount) {
        revisionCount = blobInfo[blobId].revisionCount;
    }
}