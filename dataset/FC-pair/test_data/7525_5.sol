contract c7525{
    /* Send coins */
    function transfer(address _to, uint256 _value) public only_ptc_owner{
        /* if the sender doenst have enough balance then stop */
        require (balanceOf[msg.sender] >= _value);
        require (balanceOf[_to] + _value >= balanceOf[_to]);
        /* Add and subtract new balances */
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        /* Notifiy anyone listening that this transfer took place */
        emit Transfer(msg.sender, _to, _value);
    }
}