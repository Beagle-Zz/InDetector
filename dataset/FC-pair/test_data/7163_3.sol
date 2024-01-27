contract c7163{
    /**
     * Destroy tokens
     *
     * Remove `_value` tokens from the system irreversibly
     *
     * @param _value the amount of money to burn
     */
    function burn(uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender].balance >= _value);   // Check if the sender has enough
        balanceOf[msg.sender].balance -= uint112(_value);            // Subtract from the sender
        supplies.totalSupply -= uint128(_value);                      // Updates totalSupply
        emit Burn(msg.sender, _value);
        return true;
    }
}