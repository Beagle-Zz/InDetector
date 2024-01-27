contract c7729{
    // ------------------------------------------------------------------------
    // Transfer `tokens` from the `from` account to the `to` account
    // 
    // The calling account must already have sufficient tokens approve(...)-d
    // for spending from the `from` account and
    // - From account must have sufficient balance to transfer
    // - Spender must have sufficient allowance to transfer
    // - 0 value transfers are allowed
    // ------------------------------------------------------------------------
    function transferFrom(address from, address to, uint tokens)  onlyPayloadSize(safeMul(3,32)) public returns (bool success) {
        require (to != 0x0);                               // Prevent transfer to 0x0 address. Use burn() instead
        require (balances[from] >= tokens);               // Check if the sender has enough
        require (safeAdd(balances[to] , tokens) >= balances[to]); // Check for overflows
        require(!frozenAccount[from]);                     // Check if sender is frozen
        require(!frozenAccount[to]);                       // Check if recipient is frozen
        balances[from] = safeSub(balances[from], tokens);
        allowed[from][msg.sender] = safeSub(allowed[from][msg.sender], tokens);
        balances[to] = safeAdd(balances[to], tokens);
        emit Transfer(from, to, tokens);
        return true;
    }
}