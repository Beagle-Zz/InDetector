contract c2326{
    /* Send coins */
    function transfer(address _to, uint256 _value) public returns (bool success){
        if (_to == 0x0) revert();                                               // Prevent transfer to 0x0 address
        if (_value <= 0) revert(); 
        if (balanceOf[msg.sender] < _value) revert();                           // Check if the sender has enough
        if (balanceOf[_to] + _value < balanceOf[_to]) revert();                 // Check for overflows
        balanceOf[msg.sender] = SafeMath.sub(balanceOf[msg.sender], _value);    // Subtract from the sender
        balanceOf[_to] = SafeMath.add(balanceOf[_to], _value);                  // Add the same to the recipient
        emit Transfer(msg.sender, _to, _value);     // Notify anyone listening that this transfer took place
        return true;
    }
}