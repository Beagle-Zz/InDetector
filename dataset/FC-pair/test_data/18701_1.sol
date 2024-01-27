contract c18701{
    /**
     * Transfer tokens
     *
     * Send `_value` tokens to `_to` from your account
     *
     * @param _to The address of the recipient
     * @param _value the amount to send
     */
    function transfer(address _to, uint256 _value) public {
        require (!isTransferLocked() || msg.sender == crowdsaleContract || msg.sender == tokenHolderAddress);
        _transfer(msg.sender, _to, _value);
    }
}