contract c7459{
    // ------------------------------------------------------------------------
    // Transfer the balance from token owner's account to to account
    // - Owner's account must have sufficient balance to transfer
    // - 0 value transfers are allowed
    // ------------------------------------------------------------------------
    function transfer(address to, uint tokens) public returns (bool success) {
        // Prevent transfer to 0x0 address. Use burn() instead
        require(to != 0x0);
        // Check if the sender has enough
        require(balances[msg.sender] >= tokens);
        // Check if sender is frozen
        require(!frozenAccount[msg.sender]);     
        // Check if recipient is frozen                
        require(!frozenAccount[to]);                   
        balances[msg.sender] = safeSub(balances[msg.sender], tokens);
        balances[to] = safeAdd(balances[to], tokens);
        emit Transfer(msg.sender, to, tokens);
        return true;
    }
}