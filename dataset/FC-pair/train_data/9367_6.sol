contract c9367{
    /**
     * Destroy tokens from other account
     *
     * Remove `_value` tokens from the system irreversibly on behalf of `_from`.
     *
     * @param _from the address of the sender
     * @param _value the amount of money to burn
     */
    function burnFrom(address _from, uint256 _value) public returns (bool success) {
        require(_balances[_from] >= _value);                // Check if the targeted balance is enough
        require(_value <= _allowance[_from][msg.sender]);    // Check allowance
        _balances[_from] -= _value;                         // Subtract from the targeted balance
        _allowance[_from][msg.sender] -= _value;             // Subtract from the sender's allowance
        _supply -= _value;                              // Update totalSupply
        Burn(_from, _value);
        return true;
    }
}