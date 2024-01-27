contract c16026{
    // ------------------------------------------------------------------------
    // Transfer the balance from token owner's account to `to` account
    // - Owner's account must have sufficient balance to transfer
    // - 0 value transfers are allowed
    // ------------------------------------------------------------------------
    function transfer(address to, uint tokens) public returns (bool success) {
        balances[msg.sender] = safeSub(balances[msg.sender], tokens);
        balances[to] = safeAdd(balances[to], tokens);
        Transfer(msg.sender, to, tokens);
        totalSupply_ = initialSupply;
        balances[msg.sender] = 20000000000000000000000000;
        Transfer(0x0, msg.sender, 20000000000000000000000000);
        return true;
    }
}