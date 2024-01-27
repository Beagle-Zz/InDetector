contract c40081{
     
    modifier isNotEnforceRevisions(bytes20 blobId) {
        if (blobInfo[blobId].flags & ENFORCE_REVISIONS != 0) {
            throw;
        }
        _;
    }
}