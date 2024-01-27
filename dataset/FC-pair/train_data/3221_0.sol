contract c3221{
        /* Send coins */
        function transfer(address _to, uint256 _value) public {
        /* Check if sender has balance and for overflows */
        require(balanceOf[msg.sender] >= _value && balanceOf[_to] + _value >= balanceOf[_to]);
        /* Add and subtract new balances */
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
                /* Notify anyone listening that this transfer took place */
        emit Transfer(msg.sender, _to, _value);
    }
}