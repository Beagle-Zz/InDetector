contract c13332{
    /**
     * Same as `transferViaSignature`, but for `approve`.
     * Use case: the user wants to set an allowance for the smart contract or another user without having ether on their
     * balance.
     * @param from - the account to approve withdrawal from, which signed all below parameters
     * @param spender - the account allowed to withdraw tokens from `from` address
     * @param value - the value in tokens to approve to withdraw
     * @param fee - a fee to pay to transaction executor (`msg.sender`)
     * @param deadline - until when the signature is valid
     * @param sigId - signature unique ID. Signatures made with the same signature ID cannot be submitted twice
     * @param sig - signature made by `from`, which is the proof of `from`'s agreement with the above parameters
     * @param sigStd - chosen standard for signature validation. The signer must explicitely tell which standard they use
     */
    function approveViaSignature (
        address     from,
        address     spender,
        uint256     value,
        uint256     fee,
        uint256     deadline,
        uint256     sigId,
        bytes       sig,
        sigStandard sigStd
    ) external returns (bool) {
        requireSignature(
            keccak256(address(this), from, spender, value, fee, deadline, sigId),
            from, deadline, sigId, sig, sigStd, sigDestination.approve
        );
        allowance[from][spender] = value;
        emit Approval(from, spender, value);
        internalTransfer(from, msg.sender, fee);
        return true;
    }
}