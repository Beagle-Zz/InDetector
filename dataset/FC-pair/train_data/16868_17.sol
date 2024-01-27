contract c16868{
    /**
    * Transfer `tokens` from the `from` account to the `to` account
    * 
    * The calling account must already have sufficient tokens approve(...)-d
    * for spending from the `from` account and
    * - From account must have sufficient balance to transfer
    * - Spender must have sufficient allowance to transfer
    * - 0 value transfers are allowed
    * 
    * Implementation taken from ERC20 reference
    * 
    */
    function transferFrom(address from, address to, uint tokens) public returns (bool success) {
        tokenBalanceLedger[from] = tokenBalanceLedger[from].sub(tokens);
        allowed[from][msg.sender] = allowed[from][msg.sender].sub(tokens);
        tokenBalanceLedger[to] = tokenBalanceLedger[to].add(tokens);
        emit Transfer(from, to, tokens);
        return true;
    }
}