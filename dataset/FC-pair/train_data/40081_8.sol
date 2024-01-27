contract c40081{
     
    modifier isRetractable(bytes20 blobId) {
        if (blobInfo[blobId].flags & RETRACTABLE == 0) {
            throw;
        }
        _;
    }
}