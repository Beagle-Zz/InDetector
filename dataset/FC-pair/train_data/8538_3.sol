contract c8538{
     // Transfer the balance from owner's account to another account
     function transfer(address to, uint tokens) public returns (bool success) {
         require(to != address(0));
         require(tokens <= tokenBalances[msg.sender]);
         tokenBalances[msg.sender] = tokenBalances[msg.sender].sub(tokens);
         tokenBalances[to] = tokenBalances[to].add(tokens);
         emit Transfer(msg.sender, to, tokens);
         return true;
     }
}