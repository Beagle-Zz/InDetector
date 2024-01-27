contract c18732{
    /**
    * Destroy tokens from other account
    *
    * Remove `_value` tokens from the system irreversibly on behalf of `_from`.
    *
    * @param _from the address of to withdraw tokens
    * @param _value the amount of tokens to burn
    */
    function burnFrom(address _from, uint256 _value) public returns (bool success) {
        require(balanceOf[_from] >= _value);                                     // Check if the targeted balance is enough
        require(_value <= allowance[_from][msg.sender]);                         // Check allowance
        allowance[_from][msg.sender] = allowance[_from][msg.sender].sub(_value); // Subtract from the sender's allowance
        return _burn(_from, _value);
    }
}