contract c4147{
    /* Send coins */
    function transfer(address _to, uint256 _value) realUser(_to) transable public returns (bool) {
        require(balanceOf[msg.sender] >= _value);          // Check if the sender has enough
        balanceOf[msg.sender] = balanceOf[msg.sender].sub(_value);
        balanceOf[_to] = balanceOf[_to].add(_value);
        emit Transfer(msg.sender, _to, _value);                   // Notify anyone listening that this transfer took place
        return true;
    }
}