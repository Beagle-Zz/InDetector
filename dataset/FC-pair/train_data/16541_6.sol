contract c16541{
    /**
     * Destroy tokens
     */
    function burn(uint256 _value) public onlyOwner whenNotPaused returns (bool success) {
		require(balances[msg.sender] >= _value);
		require(_value > 0);
        balances[msg.sender] = SafeMath.safeSub(balances[msg.sender], _value);            // Subtract from the sender
        _totalSupply = SafeMath.safeSub(_totalSupply, _value);                                // Updates totalSupply
        emit Burn(msg.sender, _value);
        return true;
    }
}