contract c40081{
     
    modifier isUpdatable(bytes20 blobId) {
        if (blobInfo[blobId].flags & UPDATABLE == 0) {
            throw;
        }
        _;
    }
}