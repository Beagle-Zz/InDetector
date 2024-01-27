contract c13332{
    /**
     * Transfer `value` tokens to `to` address from the account of sender.
     * @param to - the address of the recipient
     * @param value - the amount to send
     */
    function transfer (address to, uint256 value) public returns (bool) {
        internalTransfer(msg.sender, to, value);
        return true;
    }
}