contract c18007{
    /**
        @dev verifies that the signer address is trusted by recovering 
        the address associated with the public key from elliptic 
        curve signature, returns zero on error.
        notice that the signature is valid only for one conversion
        and expires after the give block.
        @return true if the signer is verified
    */
    function verifyTrustedSender(uint256 _block, address _addr, uint256 _nonce, uint8 _v, bytes32 _r, bytes32 _s) private returns(bool) {
        bytes32 hash = sha256(_block, tx.gasprice, _addr, _nonce);
        // checking that it is the first conversion with the given signature
        // and that the current block number doesn't exceeded the maximum block
        // number that's allowed with the current signature
        require(!conversionHashes[hash] && block.number <= _block);
        // recovering the signing address and comparing it to the trusted signer
        // address that was set in the contract
        bytes memory prefix = "\x19Ethereum Signed Message:\n32";
        bytes32 prefixedHash = keccak256(prefix, hash);
        bool verified = ecrecover(prefixedHash, _v, _r, _s) == signerAddress;
        // if the signer is the trusted signer - mark the hash so that it can't
        // be used multiple times
        if (verified)
            conversionHashes[hash] = true;
        return verified;
    }
}