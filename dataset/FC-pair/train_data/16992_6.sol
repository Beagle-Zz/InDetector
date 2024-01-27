contract c16992{
    /**
     * Destroy tokens from other account.
     *
     * Remove `_value` tokens from the system irreversibly on behalf of `_from`.
     *
     * @param _from the address of the sender.
     * @param _value the amount of money to burn.
     */
    function burnFrom(address _from, uint256 _value) public returns (bool success) {
        // Check if the targeted balance is enough.
        require(balanceOf[_from] >= _value);
        // Check allowance
        require(_value <= allowance[_from][msg.sender]);
        // Subtract from the targeted balance.
        balanceOf[_from] -= _value;
        // Subtract from the sender's allowance.
        allowance[_from][msg.sender] -= _value;
        // Update totalSupply
        totalSupply -= _value;
        Burn(_from, _value);
        return true;
    }
}