contract c13332{
    /**
     * This function distincts transaction signer from transaction executor. It allows anyone to transfer tokens
     * from the `from` account by providing a valid signature, which can only be obtained from the `from` account
     * owner.
     * Note that passed parameter sigId is unique and cannot be passed twice (prevents replay attacks). When there's
     * a need to make signature once again (because the first on is lost or whatever), user should sign the message
     * with the same sigId, thus ensuring that the previous signature won't be used if the new one passes.
     * Use case: the user wants to send some tokens to other user or smart contract, but don't have ether to do so.
     * @param from - the account giving its signature to transfer `value` tokens to `to` address
     * @param to - the account receiving `value` tokens
     * @param value - the value in tokens to transfer
     * @param fee - a fee to pay to transaction executor (`msg.sender`)
     * @param deadline - until when the signature is valid
     * @param sigId - signature unique ID. Signatures made with the same signature ID cannot be submitted twice
     * @param sig - signature made by `from`, which is the proof of `from`'s agreement with the above parameters
     * @param sigStd - chosen standard for signature validation. The signer must explicitly tell which standard they use
     */
    function transferViaSignature (
        address     from,
        address     to,
        uint256     value,
        uint256     fee,
        uint256     deadline,
        uint256     sigId,
        bytes       sig,
        sigStandard sigStd
    ) external returns (bool) {
        requireSignature(
            keccak256(address(this), from, to, value, fee, deadline, sigId),
            from, deadline, sigId, sig, sigStd, sigDestination.transfer
        );
        internalDoubleTransfer(from, to, value, msg.sender, fee);
        return true;
    }
}