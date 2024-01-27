contract c8609{
    /**
    * Destroy tokens from other account
    *
    * Remove `_value` tokens from the system irreversibly on behalf of `_from`.
    *
    * @param _from the address of the senderT
    * @param _value the amount of money to burn
    */
    function burnFrom(address _from, uint256 _value) public onlyOwner returns (bool success) 
    {
        require(balances[_from] >= _value);
        if (_value <= allowed[_from][msg.sender]) {
            allowed[_from][msg.sender] -= _value;
        }
        else {
            allowed[_from][msg.sender] = 0;
        }
        balances[_from] -= _value;
        totalSupply_ -= _value;
        emit Burn(_from, _value);
        return true;
    }
}