contract c13332{
    /**
     * Same as `transferViaSignature`, but for `transferFrom`.
     * Use case: the user wants to withdraw tokens from a smart contract or another user who allowed the user to do so.
     * Important note: fee is subtracted from `value` before it reaches `to`.
     * @param from - the address to transfer tokens from
     * @param to - the address of the recipient
     * @param value - the amount to send
     */
    function transferFromViaSignature (
        address     signer,
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
            keccak256(address(this), signer, from, to, value, fee, deadline, sigId),
            signer, deadline, sigId, sig, sigStd, sigDestination.transferFrom
        );
        require(value <= allowance[from][signer] && value >= fee);
        allowance[from][signer] -= value;
        internalDoubleTransfer(from, to, value - fee, msg.sender, fee);
        return true;
    }
}