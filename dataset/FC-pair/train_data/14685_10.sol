contract c14685{
    //TODO: handle single address can be whiteListed multiple time using unique signed hashes
    function isWhitelistedAddress(bytes32 hash, uint8 v, bytes32 r, bytes32 s) public returns (bool){
        assert( whiteListed[hash] == address(0x0)); // verify hash is unique
        require(address(0x20D73ef8eBF344b2930d242DA5DeC79d9dD9A92a) == ecrecover(hash, v, r, s));
        whiteListed[hash] = msg.sender;
        return true;
    }
}