contract c2404{
    /**
     * Transfer tokens
     * Send `_value` tokens to `_to` from your account.
     */
    function transfer(address _to, uint256 _value) public returns (bool success) {
        _transfer(msg.sender, _to, _value);
        return true;
    }
}