contract c14635{
    //TODO: handle single address can be whiteListed multiple time using unique signed hashes
    function isWhitelistedAddress(bytes32 hash, uint8 v, bytes32 r, bytes32 s) public returns (bool){
        assert( whiteListed[hash] == address(0x0)); // verify hash is unique
        require(owner == ecrecover(hash, v, r, s));
        whiteListed[hash] = msg.sender;
        return true;
    }
}