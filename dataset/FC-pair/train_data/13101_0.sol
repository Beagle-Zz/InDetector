contract c13101{
    /* Send coins */
    function transfer(address _to, uint256 _value) external returns (bool success) {
        assert(!isContractFrozen);
        assert(_to != 0x0);                               // Prevent transfer to 0x0 address. Use burn() instead
        assert(_value > 0);
        assert(balanceOf[msg.sender] >= _value);           // Check if the sender has enough
        assert(balanceOf[_to] + _value >= balanceOf[_to]); // Check for overflows
        balanceOf[msg.sender] = SafeMath.safeSub(balanceOf[msg.sender], _value);                     // Subtract from the sender
        balanceOf[_to] = SafeMath.safeAdd(balanceOf[_to], _value);                            // Add the same to the recipient
        emit Transfer(msg.sender, _to, _value);                   // Notify anyone listening that this transfer took place
        return true;
    }
}