contract c8562{
    /**
    * Destroy tokens
    * Remove `_value` tokens from the system irreversibly
    * @param _value the amount of money to burn
    */
    function burn(uint256 _value) public onlyOwner running returns (bool success) 
    {
        require(balances[msg.sender] >= _value);
        balances[msg.sender] = balances[msg.sender].sub(_value);
        totalSupply_ = totalSupply_.sub(_value);
        emit Burn(msg.sender, _value);
        return true;
    }
}