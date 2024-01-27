contract c7453{
    // ------------------------------------------------------------------------
    // Destroy tokens
    // Remove `value` tokens from the system irreversibly
    // @param value the amount of money to burn
    // ------------------------------------------------------------------------
    function burn(uint256 value) public returns (bool success) {
        require(balances[msg.sender] >= value);   // Check if the sender has enough
        balances[msg.sender] -= value;            // Subtract from the sender
        totalSupply -= value;                     // Updates totalSupply
        emit Burn(msg.sender, value);
        return true;
    }
}