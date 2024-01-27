contract c7696{
    // ------------------------------------------------------------------------
    // ERC20 transferFrom:
    // Transfer `tokens` from the `from` account to the `to` account
    // The calling account must already have sufficient tokens approve(...)-d
    // for spending from the `from` account and
    // - From account must have sufficient balance to transfer
    // - Spender must have sufficient allowance to transfer
    // - 0 value transfers are allowed
    // ------------------------------------------------------------------------
    function transferFrom(address from, address to, uint tokens) public returns (bool success) {
        require(frozen == false); 
        require(bitmask_check(to, 1024) == false); // banned == false
        updateAccount(from);
        updateAccount(to);
        uint fromOldBal = accounts[from].balance;
        uint toOldBal = accounts[to].balance;
        accounts[from].balance = accounts[from].balance.sub(tokens);
        allowed[from][msg.sender] = allowed[from][msg.sender].sub(tokens);
        accounts[to].balance = accounts[to].balance.add(tokens);
        require(renewDec(fromOldBal, accounts[from].balance));
        require(renewDec(toOldBal, accounts[to].balance));
        emit Transfer(from, to, tokens);
        return true; 
    }
}