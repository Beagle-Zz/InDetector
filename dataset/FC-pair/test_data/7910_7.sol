contract c7910{
    /**
     * Transfer tokens
     *
     * Send `value` tokens to `to` from your account
     *
     * @param to The address of the recipient
     * @param value the amount to send
     */
    function transfer(address to, uint256 value) public returns (bool success)  {
        _transfer(msg.sender, to, value);
        return true;
    }
}