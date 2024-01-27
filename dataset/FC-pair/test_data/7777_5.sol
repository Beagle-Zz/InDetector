contract c7777{
    /**
     * Transfer the balance from token owner's account to `to` account
     * - Owner's account must have sufficient balance to transfer
     * - 0 value transfers are allowed
     */
    function transfer(address to, uint256 tokens) onlyPayloadSize(2 * 32) public returns (bool success) {
        require(to != address(0));
        require(tokens <= balances[msg.sender]);
        balances[msg.sender] = balances[msg.sender].sub(tokens);
        balances[to] = balances[to].add(tokens);
        emit Transfer(msg.sender, to, tokens);
        return true;
    }
}