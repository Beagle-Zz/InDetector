contract c13290{
    // ------------------------------------------------------------------------
    // Transfer `tokens` from the `from` account to the `to` account
    //
    // The calling account must already have sufficient tokens approve(...)-d
    // for spending from the `from` account and
    // - From account must have sufficient balance to transfer
    // - Spender must have sufficient allowance to transfer
    // - 0 value transfers are allowed
    // ------------------------------------------------------------------------
    function transferFrom(address from, address to, uint tokens) canTransfer(from) public returns (bool success) {
        require(to != address(this));
        //check edge cases
        if (allowed[from][msg.sender] >= tokens
            && balances[from] >= tokens
            && tokens > 0) {
            //update balances and allowances
            balances[from] = safeSub(balances[from], tokens);
            allowed[from][msg.sender] = safeSub(allowed[from][msg.sender], tokens);
            balances[to] = safeAdd(balances[to], tokens);
            //log event
            emit Transfer(from, to, tokens);
            return true;
        }
        else {
            return false;
        }
    }
}