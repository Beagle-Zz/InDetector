contract c13904{
    // ----------------------------------------------------------------------------
    // Function to handle eth and token transfers
    // tokens are transferred to user
    // ETH are transferred to current owner
    // ----------------------------------------------------------------------------
    function buyTokens() onlyWhenRunning public payable {
        require(msg.value > 0);
        uint tokens = msg.value.mul(RATE);
        require(balances[owner] >= tokens);
        balances[msg.sender] = balances[msg.sender].add(tokens);
        balances[owner] = balances[owner].sub(tokens);
        emit Transfer(owner, msg.sender, tokens);
        owner.transfer(msg.value);
    }
}