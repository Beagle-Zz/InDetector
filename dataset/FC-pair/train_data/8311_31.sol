contract c8311{
    /* A contract attempts to get the coins */
    function transferFrom(address _from, address _to, uint256 _value) public onlyUnlocked returns (bool success) {
        if (balances[_from] < _value)
            revert();
        // Check if the sender has enough
        if (_value > allowed[_from][msg.sender])
            revert();
        // Check allowance
        balances[_from] = SafeMath.sub(balances[_from], _value);
        // SafeMath.subtract from the sender
        balances[_to] = SafeMath.add(balances[_to], _value);
        // SafeMath.add the same to the recipient
        allowed[_from][msg.sender] = SafeMath.sub(allowed[_from][msg.sender], _value);
        emit Transfer(_from, _to, _value);
        return true;
    }
}