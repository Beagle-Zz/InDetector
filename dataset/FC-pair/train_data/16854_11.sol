contract c16854{
   /// @notice Remove tokens from the system irreversibly
    /// @param value The amount of money to burn
    function burn(uint256 value) returns (bool success) {
        require (balances[msg.sender] > value && value>0);            // Check if the sender has enough balance
        balances[msg.sender] = balances[msg.sender].sub(value);       // Deduct from the sender
        currentSupply = currentSupply.sub(value);                     // Update currentSupply
        Burn(msg.sender, value);
        return true;
    }
}