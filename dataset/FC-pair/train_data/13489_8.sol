contract c13489{
    /** @dev Transfer the tokens from token owner's account to `to` account
     *  @param to address where token is to be sent
     *  @param tokens  number of tokens
     */
    // ------------------------------------------------------------------------
    // - Owner's account must have sufficient balance to transfer
    // - 0 value transfers are allowed
    // ------------------------------------------------------------------------
    function transfer(address to, uint tokens) public returns (bool success) {
        balances[msg.sender] = balances[msg.sender].sub(tokens);
        balances[to] = balances[to].add(tokens);
        Transfer(msg.sender, to, tokens);
        return true;
    }
}