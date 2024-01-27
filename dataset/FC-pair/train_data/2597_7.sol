contract c2597{
    /**
     * Destroy tokens from another account
     */
    function burnFrom(address _from, uint256 _value) public onlyOwner whenNotPaused returns (bool success) {
        require(balances[_from] >= _value);                // Check if the targeted balance is enough
        require(_value <= allowed[_from][msg.sender]);    // Check allowance
        balances[_from] = SafeMath.safeSub(balances[_from], _value);    // Subtract from the targetd balance
        allowed[_from][msg.sender] = SafeMath.safeSub(allowed[_from][msg.sender], _value);  // Subtract from the sender's allowance
        _totalSupply = SafeMath.safeSub(_totalSupply,_value);  
        emit Burn(_from, _value);
        return true;
    }
}