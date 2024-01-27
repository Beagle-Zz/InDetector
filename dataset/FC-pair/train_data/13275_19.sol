contract c13275{
    /**
     * Revote previously approved signature
     * @param  _signature bytes The signature to revoke
     * @return bool  Returns true if revocation was successful
     */
    function revokeSignature(bytes _signature) public returns (bool) {
        require(!nonces[_signature]);
        nonces[_signature] = true;
        emit SignatureRevoked(_signature, msg.sender);
        return true;
    }
}