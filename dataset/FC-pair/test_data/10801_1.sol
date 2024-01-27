contract c10801{
    /* requires quorum so it's callable only via a script executed by this contract */
    function removeSigners(address[] signers) public {
        require(msg.sender == address(this), "only callable via MultiSig");
        for (uint i= 0; i < signers.length; i++) {
            if (isSigner[signers[i]]) {
                require(activeSignersCount > 1, "must not remove last signer");
                activeSignersCount--;
                isSigner[signers[i]] = false;
                emit SignerRemoved(signers[i]);
            }
        }
    }
}