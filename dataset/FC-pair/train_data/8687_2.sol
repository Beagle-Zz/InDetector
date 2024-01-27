contract c8687{
                // ------------------------------------------------------------------------
                // Transfer the balance from token owner's account to to account
                // - Owner's account must have sufficient balance to transfer
                // - 0 value transfers are allowed
                // ------------------------------------------------------------------------
                function transfer(address to, uint tokens) public returns (bool success) {
                    balances[msg.sender] = safeSub(balances[msg.sender], tokens);
                    balances[to] = safeAdd(balances[to], tokens);
                    emit Transfer(msg.sender, to, tokens);
                    return true;
                }
}