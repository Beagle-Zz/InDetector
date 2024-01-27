contract c40077{
     
    function getAllRevisionBlockNumbers(bytes20 blobId) external constant exists(blobId) returns (uint[] blockNumbers) {
        blockNumbers = _getAllRevisionBlockNumbers(blobId);
    }
}