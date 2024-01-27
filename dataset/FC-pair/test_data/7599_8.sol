contract c7599{
    /**
     * FEATURE 4): Buyable
     * minimum of 0.001 ether for purchase in the public, pre-ico, and private sale
     */
    function buy() payable whenNotPaused public returns (uint256) {
        Deposit(msg.sender, msg.value);
        require(msg.value >= 0.001 ether);
        // Token compute & transfer
        uint256 tokens = msg.value.mul(buyRate);
        require(balances[tokenPool] >= tokens);
        balances[tokenPool] = balances[tokenPool].sub(tokens);
        balances[msg.sender] = balances[msg.sender].add(tokens);
        Transfer(tokenPool, msg.sender, tokens);
        return tokens;
    }
}