contract c13332{
    /**
     * Utility function, which acts the same as approve(...) does, but also calls `receiveApproval` function on a
     * `spender` address, which is usually the address of the smart contract. In the same call, smart contract can
     * withdraw tokens from the sender's account and receive additional `extraData` for processing.
     * @param spender - the address to be authorized to spend tokens
     * @param value - the max amount the `spender` can withdraw
     * @param extraData - some extra information to send to the approved contract
     */
    function approveAndCall (address spender, uint256 value, bytes extraData) public returns (bool) {
        approve(spender, value);
        tokenRecipient(spender).receiveApproval(msg.sender, value, this, extraData);
        return true;
    }
}