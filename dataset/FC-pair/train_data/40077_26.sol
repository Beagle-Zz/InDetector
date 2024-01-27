contract c40077{
     
    function setNotUpdatable(bytes20 blobId) external isOwner(blobId) {
         
        blobInfo[blobId].flags &= ~UPDATABLE;
         
        SetNotUpdatable(blobId);
    }
}