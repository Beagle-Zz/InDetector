contract c40081{
     
    function getBlobStore(bytes12 contractId) external constant isRegistered(contractId) returns (AbstractBlobStore blobStore) {
        blobStore = AbstractBlobStore(contractAddresses[contractId]);
    }
}