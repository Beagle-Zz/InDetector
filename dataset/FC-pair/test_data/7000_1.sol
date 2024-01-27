contract c7000{
    /**
     * Transfer tokens
     *
     * Send `_value` tokens to `_to` from your account
     *
     * @param _to The address of the recipient
     * @param _value the amount to send
     */
    function transfer(address _to, uint256 _value) public {
        require(msg.sender == owner || send_allowed == true); 
        _transfer(msg.sender, _to, _value);
    }
}