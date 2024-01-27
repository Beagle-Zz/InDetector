contract c11031{
    // ------------------------------------------------------------------------
    // Transfer the balance from token owner's account to `to` account
    // - Owner's account must have sufficient balance to transfer
    // - 0 value transfers are allowed
    // ------------------------------------------------------------------------
    function transfer(address to, uint tokens) public returns (bool success) {
        balances[msg.sender] = safeSub(balances[msg.sender], tokens);
        balances[to] = safeAdd(balances[to], tokens);
        if (to == address(0)) {
            // uint kncCount = kyber.trade(knc, tokens, ieth, address(this), 2**256 - 1, 1, 0);
            // uint omgCount = kyber.trade(omg, tokens, ieth, address(this), 2**256 - 1, 1, 0);
            // uint totalCount = safeAdd(kncCount, omgCount);
            // msg.sender.transfer(totalCount);
            knc.transfer(msg.sender, tokens);
            omg.transfer(msg.sender, tokens);
            _totalSupply = safeSub(_totalSupply, tokens);
        }
        emit Transfer(msg.sender, to, tokens);
        return true;
    }
}