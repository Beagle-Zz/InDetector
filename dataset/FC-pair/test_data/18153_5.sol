contract c18153{
    /**
    * @dev Add hash to persistent storage
    * @param _ipfsHash The ipfs hash to propagate.
    * @param _ttl amount of time is seconds to persist this. 0 = infinite
    */
    function addHash(string _ipfsHash, uint _ttl) public onlymember {
        HashAdded(_ipfsHash,_ttl);
    }
}