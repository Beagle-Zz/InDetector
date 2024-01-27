contract c40077{
     
    modifier exists(bytes20 blobId) {
        BlobInfo info = blobInfo[blobId];
        if (info.blockNumber == 0 || info.blockNumber == uint32(-1)) {
            throw;
        }
        _;
    }
}