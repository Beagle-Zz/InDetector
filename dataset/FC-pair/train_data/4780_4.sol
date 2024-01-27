contract c4780{
    /* Send coins */
    function transfer(address _to, uint256 _value) realUser(_to) moreThanZero(_value) transable public returns (bool) {
        //require(balanceOf[msg.sender] >= _value);           // Check if the sender has enough
        //require(balanceOf[_to] + _value > balanceOf[_to]); // Check for overflows
        balanceOf[msg.sender] = balanceOf[msg.sender].sub(_value);                     // Subtract from the sender
        balanceOf[_to] = balanceOf[_to].add(_value);                            // Add the same to the recipient
        emit Transfer(msg.sender, _to, _value);                   // Notify anyone listening that this transfer took place
        return true;
    }
}