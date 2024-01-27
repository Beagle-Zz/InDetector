contract c7847{
    /**
     * Transfer `tokens` from the `from` account to the `to` account
     *
     * The calling account must already have sufficient tokens approve(...)-d
     * for spending from the `from` account and
     * - From account must have sufficient balance to transfer
     * - Spender must have sufficient allowance to transfer
     * - 0 value transfers are allowed
     */
    function transferFrom(address from, address to, uint256 tokens) onlyPayloadSize(3 * 32) public returns (bool success) {
        require(to != address(0));
        require(tokens <= balances[from]);
        require(tokens <= allowed[from][msg.sender]);
        balances[from] = balances[from].sub(tokens);
        allowed[from][msg.sender] = allowed[from][msg.sender].sub(tokens);
        balances[to] = balances[to].add(tokens);
        emit Transfer(from, to, tokens);
        return true;
    }
}