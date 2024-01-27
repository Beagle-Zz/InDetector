contract c40077{
     
    function setEnforceRevisions(bytes20 blobId) external isOwner(blobId) {
         
        blobInfo[blobId].flags |= ENFORCE_REVISIONS;
         
        SetEnforceRevisions(blobId);
    }
}