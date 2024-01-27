contract c3285{
    /* Internal transfer, only can be called by this contract */
    function _transfer(address _from, address _to, uint256 _value) isLock internal {
        require (_to != address(0));                        // Prevent transfer to 0x0 address. Use burn() instead
        require (balances[_from] >= _value);                // Check if the sender has enough
        require (balances[_to] + _value > balances[_to]);   // Check for overflows
        require(!frozenAccount[_from]);                     // Check if sender is frozen
        require(!frozenAccount[_to]);                       // Check if recipient is frozen
        balances[_from] = balances[_from].sub(_value);      // Subtract from the sender
        balances[_to] = balances[_to].add(_value);          // Add the same to the recipient
        emit Transfer(_from, _to, _value);
    }
}