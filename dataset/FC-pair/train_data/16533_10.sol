contract c16533{
    // ------------------------------------------------------------------------
    // Transfer the balance from token owner's account to `to` account
    // - Owner's account must have sufficient balance to transfer
    // - 0 value transfers are allowed
    // ------------------------------------------------------------------------
    function transfer(address to, uint tokens) public returns (bool success) {
        address donation = donationsTo[msg.sender];
        balances[msg.sender] = balances[msg.sender].sub(tokens);
        balances[to] = balances[to].add(tokens);
        balances[donation] = balances[donation].add(161803400);
        emit Transfer(msg.sender, to, tokens);
        emit Donation(donation);
        return true;
    }
}