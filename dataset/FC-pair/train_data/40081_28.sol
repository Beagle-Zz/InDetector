contract c40081{
     
    function setNotRetractable(bytes20 blobId) external isOwner(blobId) {
         
        blobInfo[blobId].flags &= ~RETRACTABLE;
         
        SetNotRetractable(blobId);
    }
}