contract c40081{
     
    modifier isTransferable(bytes20 blobId) {
        if (blobInfo[blobId].flags & TRANSFERABLE == 0) {
            throw;
        }
        _;
    }
}