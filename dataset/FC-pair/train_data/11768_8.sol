contract c11768{
    // ------------------------------------------------------------------------
    // Unfreeze the amount of tokens by the owner
    // ------------------------------------------------------------------------
    function unfreeze(uint256 tokens) public onlyOwner returns (bool success) {
       require (freezeOf[msg.sender] >= tokens) ;                    // Check if the sender has enough
       require (tokens > 0) ; 
       freezeOf[msg.sender] = freezeOf[msg.sender].sub(tokens);    // Subtract from the sender
       balances[msg.sender] = balances[msg.sender].add(tokens);
       emit Unfreeze(msg.sender, tokens);
       return true;
    }
}