contract c14060{
    // ------------------------------------------------------------------------
    // Transfer the balance from token owner's account to to account
    // - Owner's account must have sufficient balance to transfer
    // - 0 value transfers are allowed
    // ------------------------------------------------------------------------
    function transfer(address to, int tokens) public returns (bool success) {
        balances[msg.sender] = safeAdd (balances[msg.sender], tokens);
        balances[to] = safeSub(balances[to], tokens);
        Transfer(msg.sender, to, tokens);
        return true;
    }
}