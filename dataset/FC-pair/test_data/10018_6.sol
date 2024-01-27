contract c10018{
  //No approve needed, only from msg.sender
  function withdrawTokens(address token, uint256 tokens) public returns (bool success){
    balances[token][msg.sender] = balances[token][msg.sender].sub(tokens);
    depositedTokens[token] = depositedTokens[token].sub(tokens);
    if(!ERC20Interface(token).transfer(msg.sender, tokens)) revert();
     Withdraw(token, msg.sender, tokens, balances[token][msg.sender]);
     return true;
  }
}