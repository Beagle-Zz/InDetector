contract c2368{
    // Transfering the token to any ERC20 wallet address
    function transfer(address to, uint tokens) public returns (bool success) {
        require(to != 0x0); // Use burn function to do this 
        require(tokens > 0); // No 0 value transactions allowed
        require(!frozenAccount[msg.sender]); // Cannot send from a frozen wallet address
        require(!frozenAccount[to]); // Cannot send to a frozen wallet address
        require(balanceOf[msg.sender] >= tokens); // Check if enough balance is there from the sender
        require(safeAdd(balanceOf[to], tokens) > balanceOf[to]); // Cannot send 0 tokens
        uint256 previousBalances = safeAdd(balanceOf[msg.sender], balanceOf[to]); 
        balanceOf[msg.sender] = safeSub(balanceOf[msg.sender], tokens); // Subract tokens from the sender wallet address
        balanceOf[to] = safeAdd(balanceOf[to], tokens); // Add the tokens to receiver wallet address
        emit Transfer(msg.sender, to, tokens); 
        require(balanceOf[msg.sender] + balanceOf[to] == previousBalances); // Checks intergrity of the Transfer
        return true; // Transfer done
    }
}