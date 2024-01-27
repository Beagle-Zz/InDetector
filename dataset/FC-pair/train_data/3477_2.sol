contract c3477{
    /**
     * Transfer tokens from other address
     *
     * Send `_value` tokens to `_to` in behalf of `_from`
     *
     * @param _from The address of the sender
     * @param _to The address of the recipient
     * @param _value the amount to send
     */
    function transferFrom(address _from, address _to, uint256 _value) public returns(bool) {
        require(_value <= allowances[_from][msg.sender]);     // Check allowance
        allowances[_from][msg.sender] -= _value;
        return _transfer(_from, _to, _value);
    }
}