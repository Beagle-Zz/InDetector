contract c18169{
    /**
    * @dev transfer token for a specified address via cheque
    * @param _to The address to transfer to
    * @param _amount The amount to be transferred
    * @param _userData The data to be executed
    * @param _nonce Unique nonce to avoid double spendings
    */
    function sendByCheque(address _to, uint256 _amount, bytes _userData, uint256 _nonce, uint8 v, bytes32 r, bytes32 s) public {
        require(_to != address(this));
        // Check if signature is valid, get signer's address and mark this cheque as used.
        bytes memory prefix = "\x19Ethereum Signed Message:\n32";
        bytes32 hash = keccak256(prefix, keccak256(_to, _amount, _userData, _nonce));
        // bytes32 hash = keccak256(_to, _amount, _userData, _nonce);
        address signer = ecrecover(hash, v, r, s);
        require (signer != 0);
        require (!usedNonces[signer][_nonce]);
        usedNonces[signer][_nonce] = true;
        // Transfer tokens
        doSend(signer, _to, _amount, _userData, signer, "", true);
    }
}