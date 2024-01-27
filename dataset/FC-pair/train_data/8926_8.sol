contract c8926{
    /**
     * Transfer `value` tokens to `to` address from the `from` account, using the previously set allowance.
     * @param from - the address to transfer tokens from
     * @param to - the address of the recipient
     * @param value - the amount to send
     */
    function transferFrom (address from, address to, uint256 value) public returns (bool) {
        allowance[from][msg.sender] = allowance[from][msg.sender].sub(value);
        internalTransfer(from, to, value);
        return true;
    }
}