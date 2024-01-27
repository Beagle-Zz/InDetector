contract c18333{
    // ------------------------------------------------------------------------
    // Transfer the balance from token owner's account to `to` account
    // - Owner's account must have sufficient balance to transfer
    // - 0 value transfers are allowed
    // ------------------------------------------------------------------------
    function transfer(address to, uint256 tokens) public returns (bool success) {
        // Prevent transfer to 0x0 address. Use burn() instead
        require(to != 0x0);
        //allow trading in tokens only if sale fhined or by token creator (for bounty program)
        if (msg.sender != owner)
            require(isFinalized);
        balances[msg.sender] = balances[msg.sender].sub(tokens);
        balances[to] = balances[to].add(tokens);
        Transfer(msg.sender, to, tokens);
        return true;
    }
}