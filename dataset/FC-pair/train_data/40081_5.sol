contract c40081{
     
    modifier isOwner(bytes20 blobId) {
        if (blobInfo[blobId].owner != msg.sender) {
            throw;
        }
        _;
    }
}