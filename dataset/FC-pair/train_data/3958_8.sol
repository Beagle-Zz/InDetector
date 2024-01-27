contract c3958{
    /* Internal transfer, only can be called by this contract */
    function _transfer(address _from, address _to, uint _value) internal {
        uint usableBalance = balanceOf[_from] - getLockBalance(_from);
        require(balanceOf[_from] >= usableBalance);
        require(_to != 0x0);                                // Prevent transfer to 0x0 address. Use burn() instead
        require(usableBalance >= _value);                   // Check if the sender has enough
        require(balanceOf[_to] + _value > balanceOf[_to]);  // Check for overflows
        require(!frozenAccount[_from]);                     // Check if sender is frozen
        require(!frozenAccount[_to]);                       // Check if recipient is frozen
        balanceOf[_from] -= _value;                         // Subtract from the sender
        balanceOf[_to] += _value;                           // Add the same to the recipient
        emit Transfer(_from, _to, _value);
    }
}