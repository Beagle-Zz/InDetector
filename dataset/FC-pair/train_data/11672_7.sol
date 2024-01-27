contract c11672{
    // ------------------------------------------------------------------------
    // Freeze the amount of tokens by the owner
    // ------------------------------------------------------------------------
    function freeze(uint256 tokens) public onlyOwner returns (bool success) {
       require (balances[msg.sender] >= tokens) ;                   // Check if the sender has enough
       require (tokens > 0) ; 
       balances[msg.sender] = balances[msg.sender].sub(tokens);    // Subtract from the sender
       freezeOf[msg.sender] = freezeOf[msg.sender].add(tokens);     // Updates totalSupply
       emit Freeze(msg.sender, tokens);
       return true;
    }
}