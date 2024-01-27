contract c7497{
    /// @dev Lock Token
    function lockTokens(
        uint amount
    )
        public
        returns (uint totalAmountLocked)
    {
        // Adjust amount by balance
        amount = min(amount, balances[msg.sender]);
        // Update state variables
        balances[msg.sender] = sub(balances[msg.sender], amount);
        lockedTokenBalances[msg.sender] = add(lockedTokenBalances[msg.sender], amount);
        // Get return variable
        totalAmountLocked = lockedTokenBalances[msg.sender];
    }
}