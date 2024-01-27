contract c18153{
   /** 
    * Add a metadata of an object. Each proxy will then 
    * read the ipfs hash file with the metadata about the object and parse it 
    */
    function addMetadataObject(string _metadataHash) public onlymember {
        HashAdded(_metadataHash,0);
        MetadataObjectAdded(_metadataHash);
    }
}