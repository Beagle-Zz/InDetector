contract c7245{
    /* Internal transfer, only can be called by this contract */
    function _transfer(address _from, address _to, uint256 _value) internal {
        require (_to != 0x0);                               // Prevent transfer to 0x0 address. Use burn() instead
        require (balances[_from] >= _value);                 // Check if the sender has enough
        require (balances[_to] + _value > balances[_to]);   // Check for overflows
        balances[_from] = balances[_from].minus(_value);    // Subtract from the sender
        balances[_to] = balances[_to].plus(_value);         // Add the same to the recipient
        emit Transfer(_from, _to, _value);
    }
}