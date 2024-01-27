contract c8441{
    /* 
    * @dev Verifies if message was signed by owner to give access to _add for this contract.
    *      Assumes Geth signature prefix.
    * @param _add Address of agent with access
    * @param _v ECDSA signature parameter v.
    * @param _r ECDSA signature parameters r.
    * @param _s ECDSA signature parameters s.
    * @return Validity of access message for a given address.
    */
    function isValidAccessMessage(
        address _add,
        uint8 _v, 
        bytes32 _r, 
        bytes32 _s) 
        view public returns (bool)
    {
        bytes32 hash = keccak256(this, _add);
        return signer == ecrecover(
            keccak256("\x19Ethereum Signed Message:\n32", hash),
            _v,
            _r,
            _s
        );
    }
}