contract c11768{
    // ------------------------------------------------------------------------
    // Transfer the balance from token owner's account to `to` account
    // - Owner's account must have sufficient balance to transfer
    // ------------------------------------------------------------------------
    function transfer(address to, uint tokens) public returns (bool success) {
        require( tokens > 0 && to != 0x0 );
        balances[msg.sender] = balances[msg.sender].sub(tokens);
        balances[to] = balances[to].add(tokens);
        emit Transfer(msg.sender, to, tokens);
        return true;
    }
}