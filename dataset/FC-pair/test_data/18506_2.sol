contract c18506{
    /**
     * @dev transfer token for a specified address
     * @param _to The address to transfer to.
     * @param _value The amount to be transferred.
     */
    function transfer(address _to, uint256 _value) public returns (bool) {
        require(_balances[msg.sender] >= _value);
        _balances[msg.sender] =_balances[msg.sender].sub(_value);
        _balances[_to] =_balances[_to].add(_value);
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
}