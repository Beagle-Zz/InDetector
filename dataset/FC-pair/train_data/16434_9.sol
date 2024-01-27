contract c16434{
    // Withdraw tokens from the owners balance
    function withdrawTokens(address token, uint256 amount) public {
        // Can't withdraw nothing
        require(amount > 0);
        // Assert they're withdrawing what is in their balance
        require(balances[msg.sender][token] >= amount);
        // Substitute the amounts
        balances[msg.sender][token] = SafeMath.sub(balances[msg.sender][token], amount);
        tokenBalance[token] = SafeMath.sub(tokenBalance[token], amount);
        // Transfer the tokens
        ERC677 erc677 = ERC677(token);
        require(erc677.transfer(msg.sender, amount) == true);
        // Emit the event
        emit TokenWithdrawal(token, msg.sender, amount);
    }
}