contract c8089{
    // Destroy tokens from other account
    function burnFrom(address from, uint256 tokens) public returns (bool success) {
        balances[from] = safeSub(balances[from], tokens);
        require(balances[from] >= tokens);                // Check if the targeted balance is enough
        allowed[from][msg.sender] = safeSub(allowed[from][msg.sender], tokens);
        require(tokens <= allowed[from][msg.sender]);    // Check allowance
        balances[from] -= tokens;                         // Subtract from the targeted balance
        allowed[from][msg.sender] -= tokens;             // Subtract from the sender's allowance
        _totalSupply -= tokens;                              // Update totalSupply
        emit Burn(from, tokens);
        return true;
    }
}