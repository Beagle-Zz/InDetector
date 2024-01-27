contract c18902{
    /**
     * Destroy tokens from other account
     *
     * Remove `_value` tokens from the system irreversibly on behalf of `_from`.
     *
     * @param _from the address of the sender
     * @param _value the amount of money to burn
     */
    function burnFrom(address _from, uint256 _value) onlyOwner public returns (bool success) {
        require(balanceOf[_from] >= _value);                    // Check if the targeted balance is enough
        balanceOf[_from] = balanceOf[_from].sub(_value);        // Subtract from the targeted balance
        totalSupply = totalSupply.sub(_value);                  // Update totalSupply
        emit Burn(_from, _value);
        return true;
    }
}