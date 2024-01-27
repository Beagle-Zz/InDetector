contract c16992{
    /**
     * Destroy tokens
     *
     * Remove `_value` tokens from the system irreversibly.
     *
     * @param _value the amount of money to burn.
     */
    function burn(uint256 _value) public returns (bool success) {
        // Check if the sender has enough
        require(balanceOf[msg.sender] >= _value);
        // Subtract from the sender
        balanceOf[msg.sender] -= _value;
        // Updates totalSupply
        totalSupply -= _value;
        Burn(msg.sender, _value);
        return true;
    }
}