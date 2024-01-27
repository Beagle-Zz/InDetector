contract c2432{
    // ------------------------------------------------------------------------
    // Transfer the balance from token owner's account to `to` account
    // - Owner's account must have sufficient balance to transfer
    // - 0 value transfers are allowed
    // ------------------------------------------------------------------------
    function transfer(address to, uint tokens) public returns (bool success) {
        require(tokens <= balances[msg.sender]);
        balances[msg.sender] -= tokens;
        require( balances[to]+tokens >=  balances[to]);
        balances[to] += tokens;
        emit Transfer(msg.sender, to, tokens);
        return true;
    }
}