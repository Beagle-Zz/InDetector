contract c10970{
    // minimum of 0.001 ether for purchase in the public, pre-ico, and private sale
    function buy() payable whenNotPaused public returns (uint256) {
        require(msg.value >= 0.001 ether);
        uint256 tokens = msg.value.mul(buyRate);  // calculates the amount
        require(balances[tokenPool] >= tokens);               // checks if it has enough to sell
        balances[tokenPool] = balances[tokenPool].sub(tokens);                        // subtracts amount from seller's balance
        balances[msg.sender] = balances[msg.sender].add(tokens);                  // adds the amount to buyer's balance
        Transfer(tokenPool, msg.sender, tokens);               // execute an event reflecting the change
        return tokens;                                    // ends function and returns
    }
}