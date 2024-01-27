contract c16895{
    /* send coins */
    function transfer(address _to, uint256 _value) public isRunning validAddress returns (bool success) {
        require(!frozenAccount[msg.sender]);
        require(balanceOf[msg.sender] - frozenBalance[msg.sender] >= _value);
        require(balanceOf[_to] + _value >= balanceOf[_to]);
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        Transfer(msg.sender, _to, _value);
        return true;
    }
}