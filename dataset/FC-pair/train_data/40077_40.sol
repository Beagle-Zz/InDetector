contract c40077{
     
    function getOwner(bytes20 blobId) external constant exists(blobId) returns (address owner) {
        owner = blobInfo[blobId].owner;
    }
}