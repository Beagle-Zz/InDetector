contract c13101{
    /* A contract attempts to get the coins */
    function transferFrom(address _from, address _to, uint256 _value) external returns (bool success) {
        assert(!isContractFrozen);
        assert(_to != 0x0);                                // Prevent transfer to 0x0 address. Use burn() instead
        assert(_value > 0);
        assert(balanceOf[_from] >= _value);                 // Check if the sender has enough
        assert(balanceOf[_to] + _value >= balanceOf[_to]);  // Check for overflows
        assert(_value <= allowance[_from][msg.sender]);     // Check allowance
        balanceOf[_from] = SafeMath.safeSub(balanceOf[_from], _value);                           // Subtract from the sender
        balanceOf[_to] = SafeMath.safeAdd(balanceOf[_to], _value);                             // Add the same to the recipient
        allowance[_from][msg.sender] = SafeMath.safeSub(allowance[_from][msg.sender], _value);
        emit Transfer(_from, _to, _value);
        return true;
    }
}