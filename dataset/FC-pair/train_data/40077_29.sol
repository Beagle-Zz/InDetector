contract c40077{
     
    function setNotTransferable(bytes20 blobId) external isOwner(blobId) {
         
        blobInfo[blobId].flags &= ~TRANSFERABLE;
         
        SetNotTransferable(blobId);
    }
}